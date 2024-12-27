import { JSON } from '@kit.ArkTS';
import { http } from '@kit.NetworkKit';
import { tabiInfo } from '../model/tabiInfo';
import { CommonConstant as Const, ContentType } from  '../Common/CommonConstant'
import { systemDateTime } from '@kit.BasicServicesKit';

const URL: string = 'https://api.anitabi.cn/bangumi/{subjectID}/lite';


export class NetworkUtil {
  // 封装http.createHttp().request方法
  static async getResponse(url: string, params: string[]): Promise<tabiInfo | null> {
    try {
      url = url.replace('{subjectID}', params[0])
      let data: http.HttpResponse = await http.createHttp().request(
        url,
        {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'
          },
          expectDataType: http.HttpDataType.STRING,
          usingCache: true,
        });
      if (data && data.responseCode === http.ResponseCode.OK && typeof data.result === 'object') {
        let arr: tabiInfo = JSON.parse(data.result);
        return arr;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }

  async getFunctionEntryData(scene: string, fileName: string, pageNum: number,
    pageSize: number): Promise<FunctionEntryData[]> {
    let result: FunctionEntryData[] = [];
    let params: string[] = [scene, fileName, pageNum + '', pageSize + ''];
    try {
      let arr = await NetworkUtil.getResponse(URL, params);
      if (arr) {
        let tempData = arr.data as object[];
        let result: FunctionEntryData[] = [];
        for (let i = 0; i < tempData.length; i++) {
          let tmp = tempData[i] as Record<string, string>;
          let temp = new FunctionEntryData(tmp.icon, tmp.name, tmp.name_en, tmp.url, this.functionIndex);
          this.functionIndex++;
          result.push(temp);
        }
        return result;
      }
    } catch (err) {
      Logger.error('getFunctionEntryData err:', JSON.stringify(err));
    }
    return result;
  }

  async getWaterFlowData(scene: string, fileName: string, pageNum: number,
    pageSize: number): Promise<WaterFlowData[]> {
    let result: WaterFlowData[] = [];
    let params: string[] = [scene, fileName, pageNum + '', pageSize + ''];
    try {
      let arr = await NetworkUtil.getResponse(URL, params);
      if (arr) {
        let tempData = arr['data'] as object[];
        let result: WaterFlowData[] = [];
        for (let i = 0; i < tempData.length; i++) {
          let tmp = tempData[i] as Record<string, string>;
          let temWaterFlowHead =
            new WaterFlowHeadData(tmp.thumbnails, tmp.source, parseInt(tmp.width), parseInt(tmp.height), tmp.type);
          let temWaterFlowDescription =
            new WaterFlowDescriptionData(tmp.title, tmp.title_en, tmp.user_image, tmp.vip_sign,
              tmp.nick_name, parseInt(tmp.collections_count), tmp.url, this.waterFlowIndex);
          let temWaterFlow = new WaterFlowData(temWaterFlowHead, temWaterFlowDescription);
          this.waterFlowIndex++;
          result.push(temWaterFlow);
        }
        return result;
      }
    } catch (err) {
      Logger.error('getWaterFlowData err: ', JSON.stringify(err));
    }
    return result;
  }
}