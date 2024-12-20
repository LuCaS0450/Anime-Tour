import router from '@ohos.router';
@Entry
@Component
struct Page2 {
  build() {
    Column() {
      Row() {
        Button('返回搜索')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Index'
            });
          })
        Row().width('90%')
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor("rgb(255, 255, 255)");
  }
}