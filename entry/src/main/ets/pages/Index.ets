
import  router  from '@ohos.router'
@Entry
struct Index {
  private searchController: SearchController =new SearchController();
  @State changeValue: string='';

  build() {
    Column()//主界面
    {
      Row().height(20)
      Image($r('app.media.app_logo')).width(200).height(52)
      Row().height(5)
      Text('作品名称')
        .fontSize(20).fontWeight(FontWeight.Bold).fontColor(Color.Grey).textAlign(TextAlign.Center) // 水平居中

      Row() {
        Search({value : this.changeValue,placeholder:"作品名称",controller:this.searchController})
          .width('80%')
          .backgroundColor("rgb(228,247,255)")
          .onChange((value: string) => { // 监听输入变化
            this.changeValue = value; // 实时更新 searchText
            console.log('当前输入:', this.changeValue); // 调试信息
          })
        Button('搜索')
          .onClick(() => {
            console.log('点击搜索按钮，开始跳转')
            router.pushUrl({
              url: 'pages/page2'
            })
            console.log('跳转成功')
          })
      }
      .width('100%')
      .height('10%')
      .backgroundColor("rgb(228,247,255)")
    }
    .height("100%")
    .width('100%')
    .backgroundColor("rgb(228,247,255)")
  }
}