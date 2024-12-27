export class locationinfo {
  // id 地标 ID
  id: string = '';
  // cn 地标中文译名
  cn: string = '';
  // name 地标原名，默认为地标所属国家语言
  name: string = '';
  // image 地标对应截图缩略图
  image: string = '';
  // ep 集数
  ep: number = 0;
  // s 截图对应时间 单位秒
  s: number = 0;
  // geo[] 地标对应 GPS 信息
  geo: Array<number> = [];
}

export class tabiInfo {
  // id bangumi 作品 subjectID
  id : number = 0;
  // cn 作品中文译名
  cn: string = '';
  // title 作品原名
  title: string = '';
  // city 巡礼地标主要所在城市，可能为空
  city: string = '';
  // cover 作品封面图
  cover: string = '';
  // color 作品主色
  color: string = '';
  // geo[] 作品默认 GPS 坐标
  geo: Array<number> = [];
  // zoom 作品默认放大等级
  zoom: number = 0;
  // modified 数据最后更新时间戳
  modified: number = 0;
  // litePoints[] 前十个标志性地标信息
  litePoints: Array<locationinfo> = [new locationinfo()];
  // pointsLength 地标总数
  pointsLength: number = 0;
  // imagesLength 含截图的地标数
  imagesLength: number = 0;
}

