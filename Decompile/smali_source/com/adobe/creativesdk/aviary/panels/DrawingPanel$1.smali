.class Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;
.super Ljava/lang/Object;
.source "DrawingPanel.java"

# interfaces
.implements Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onActivate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method

.method public onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 11
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 214
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    const/4 v3, 0x4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    aget v4, v4, p3

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    # setter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$002(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;I)I

    .line 215
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$100(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Landroid/graphics/Paint;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 218
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v3

    invoke-interface {v2, v3}, Landroid/widget/Adapter;->getItemViewType(I)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_71

    .line 220
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    .line 225
    :goto_40
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    if-eqz v2, :cond_70

    .line 226
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->getLastCommand()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    move-result-object v0

    .line 227
    .local v0, "lastCommand":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
    if-eqz v0, :cond_70

    .line 228
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->getPoint()Landroid/graphics/PointF;

    move-result-object v1

    .line 229
    .local v1, "lastPoint":Landroid/graphics/PointF;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onEnd()V

    .line 230
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onStart()V

    .line 231
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget v3, v1, Landroid/graphics/PointF;->x:F

    iget v4, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onMoveTo(FF)V

    .line 232
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget v3, v1, Landroid/graphics/PointF;->x:F

    iget v4, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onLineTo(FF)V

    .line 235
    .end local v0    # "lastCommand":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
    .end local v1    # "lastPoint":Landroid/graphics/PointF;
    :cond_70
    return-void

    .line 222
    :cond_71
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    goto :goto_40
.end method

.method public onScrollStarted(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 8
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 239
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-ne v0, v1, :cond_11

    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    .line 242
    :cond_11
    return-void
.end method
