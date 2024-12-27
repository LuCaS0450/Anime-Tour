import { MapComponent, mapCommon, map } from '@kit.MapKit';
import { AsyncCallback } from '@kit.BasicServicesKit';

@Entry
@Component
struct BasicMapDemo {
  private mapOptions?: mapCommon.MapOptions;
  private callback?: AsyncCallback<map.MapComponentController>;
  private mapController?: map.MapComponentController;

  aboutToAppear(): void {
    // 地图初始化参数，设置地图中心点坐标及层级
    let target: mapCommon.LatLng = {
      latitude: 39.9181,
      longitude: 116.3970193
    }
    let cameraPosition: mapCommon.CameraPosition = {
      target: target,
      zoom: 15
    }
    this.mapOptions = {
      position: cameraPosition
    }

    // 地图初始化的回调
    this.callback = async (err, mapController) => {
      if (!err) {
        this.mapController = mapController;
        // 初始化marker（标记）参数
        let markerOptions: mapCommon.MarkerOptions = {
          position: {
            latitude: 39.9181,
            longitude: 116.3970193
          }
        };
        // 新建一个默认的marker图标
        await this.mapController?.addMarker(markerOptions);
      }
    }
  }

  build() {
    Stack() {
      // 调用MapComponent组件初始化地图
      MapComponent({ mapOptions: this.mapOptions, mapCallback: this.callback }).width('100%').height('100%');
    }.height('100%')
  }
}