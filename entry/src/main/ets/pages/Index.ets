@Entry
@Component
struct Index {
  private swiperController:SwiperController =new SwiperController();
  build() {
    Swiper(this.swiperController)
    {
      Column()
      {

        Text('动漫巡礼地图')
          .height(50)
          .fontSize(30)
          .fontColor(Color.Black)
          .backgroundColor("rgb(157,219,241)")
          .width('100%')
        Row() {
          Text('作品名称')
            .fontSize(20)
            .fontColor(Color.Black)
          Search()
            .width('61%')
          Button("搜索")
            .onClick(()=>{ this.swiperController.showNext();})
        }
        .width('100%')
        .height('20%')
        .backgroundColor("rgb(228,247,255)")
      }
      .height("100%")
      .width('100%')
      .backgroundColor("rgb(228,247,255)")
      Column()
      {
        Row() {
          Button("返回搜索")
            .onClick(()=>{ this.swiperController.showPrevious();})
        }
      }
      .height('100%')
      .width('100%')
      .backgroundColor("rgb(228,247,255)")
    }
  }

}