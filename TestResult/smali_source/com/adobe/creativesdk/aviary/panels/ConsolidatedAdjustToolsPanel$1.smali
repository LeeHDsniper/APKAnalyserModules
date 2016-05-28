.class Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;
.super Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
.source "ConsolidatedAdjustToolsPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .registers 7
    .param p1, "position"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onPageSelected: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 131
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->changeSeekBarToCurrent(I)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;I)V

    .line 133
    return-void
.end method
