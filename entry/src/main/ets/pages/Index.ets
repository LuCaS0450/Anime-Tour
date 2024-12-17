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
        Text('动漫巡礼地图')
          .height(50)
          .fontSize(30)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Center) // 水平居中
        Row().height(5)
          Text('作品名称')
            .fontSize(20)
            .fontColor(Color.Grey).textAlign(TextAlign.Center) // 水平居中
            .height('5%')
            .width('100%')
        Row() {
          Search({value : this.changeValue,placeholder:"作品名称",controller:this.searchController})
            .width('80%')
            .backgroundColor("rgb(228,247,255)")
            .onChange((value: string) => { // 监听输入变化
            this.changeValue = value; // 实时更新 searchText
            console.log('当前输入:', this.changeValue); // 调试信息
          })
          Button('搜索')
            .width('20%')
            .onClick(() => {
              console.log('点击搜索按钮，执行跳转');
              this.swiperController.showNext(); // 跳转到下一页
            })
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
