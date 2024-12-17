@Entry
@Component
struct Index {
  private swiperController: SwiperController = new SwiperController();
  @State private searchText: string = ''; // 定义状态变量来存储搜索框的值

  build() {
      Swiper(this.swiperController) {
      Column() {
        Text('动漫巡礼')
          .height(50)
          .fontSize(30)
          .fontColor(Color.Black)
          .backgroundColor("rgb(157,219,241)")
          .width('100%')

        Row() {
          Text('作品名称')
            .fontSize(20)
            .fontColor(Color.Black)

          Search({ value: this.searchText, placeholder: '请输入搜索内容' })
            .width('61%')
            .onChange((value: string) => { this.searchText = value; }) // 更新状态变量

          Button("搜索")
            .onClick(() => {
              this.swiperController.showNext();
            })
        }
        .width('100%')
        .height('20%')
        .backgroundColor("rgb(228,247,255)")
      }
      .height("100%")
      .width('100%')
      .backgroundColor("rgb(228,247,255)")

      Column() {
        Row() {
          Button("返回搜索")
            .onClick(() => { this.swiperController.showPrevious(); })
        }
      }
      .height('100%')
      .width('100%')
      .backgroundColor("rgb(228,247,255)")
    }
  }
}



