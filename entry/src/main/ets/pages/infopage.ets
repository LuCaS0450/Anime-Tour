import router from '@ohos.router';
@Entry
@Component
struct infopage {
  build() {
    Column() {
      Row() {
        Button('返回')
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