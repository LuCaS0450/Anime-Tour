@Entry
@Component
struct Index {
  private swiperController:SwiperController =new SwiperController();
  private searchController: SearchController =new SearchController();

  @State changeValue: string='';
  build() {
    Swiper(this.swiperController)
    {
      Column()//主界面
      {
        Row().height(40)
        Image($r('app.media.app_logo'))
          .width(200)
          .height(52)
        Row().height(5)
        Row() {
          Search({value : this.changeValue,placeholder:"作品名称",controller:this.searchController})
            .width('100%')
            .searchButton('搜索').onClick(()=>{ this.swiperController.showNext();})
            .backgroundColor("rgb(228,247,255)");
        }
        .width('100%')
        .height('10%')
        .backgroundColor("rgb(228,247,255)")
      }
      .height("100%")
      .width('100%')
      .backgroundColor("rgb(228,247,255)")
      Column()//搜索结果页面
      {
        Row( )
        {
          Button("返回搜索")
            .onClick(()=>{ this.swiperController.showPrevious();})
            .backgroundColor(Color.Grey)
          }
      }
      .justifyContent(FlexAlign.Start) // 设置水平左对齐
      .alignItems(HorizontalAlign.Start)    // 设置垂直居中
      .height('100%')
      .width('100%')
      .backgroundColor("rgb(228,247,255)")
    }
  }
}