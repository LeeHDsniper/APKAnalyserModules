.class Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;
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
    .line 251
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

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
    .line 296
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method

.method public onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 12
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
    .line 254
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    aget v4, v4, p3

    # setter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$402(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;I)I

    .line 255
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$100(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Landroid/graphics/Paint;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$400(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 257
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$400(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)I

    move-result v3

    if-nez v3, :cond_67

    const/4 v0, 0x1

    .line 259
    .local v0, "isEraser":Z
    :goto_23
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-ne v3, v4, :cond_71

    .line 260
    if-eqz v0, :cond_69

    .line 261
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    .line 273
    :cond_36
    :goto_36
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    if-eqz v3, :cond_66

    .line 274
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->getLastCommand()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    move-result-object v1

    .line 275
    .local v1, "lastCommand":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
    if-eqz v1, :cond_66

    .line 276
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->getPoint()Landroid/graphics/PointF;

    move-result-object v2

    .line 277
    .local v2, "lastPoint":Landroid/graphics/PointF;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onEnd()V

    .line 278
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onStart()V

    .line 279
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget v4, v2, Landroid/graphics/PointF;->x:F

    iget v5, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onMoveTo(FF)V

    .line 280
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    iget v4, v2, Landroid/graphics/PointF;->x:F

    iget v5, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onLineTo(FF)V

    .line 284
    .end local v1    # "lastCommand":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
    .end local v2    # "lastPoint":Landroid/graphics/PointF;
    :cond_66
    return-void

    .line 257
    .end local v0    # "isEraser":Z
    :cond_67
    const/4 v0, 0x0

    goto :goto_23

    .line 263
    .restart local v0    # "isEraser":Z
    :cond_69
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    goto :goto_36

    .line 266
    :cond_71
    if-eqz v0, :cond_85

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-eq v3, v4, :cond_85

    .line 267
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    goto :goto_36

    .line 268
    :cond_85
    if-nez v0, :cond_36

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-eq v3, v4, :cond_36

    .line 269
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v4, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    goto :goto_36
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
    .line 288
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-ne v0, v1, :cond_11

    .line 289
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    .line 291
    :cond_11
    return-void
.end method
