.class Luk/co/senab/photoview/PhotoViewAttacher$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PhotoViewAttacher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    .line 199
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 204
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    # getter for: Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;
    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$5(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 205
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    # getter for: Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;
    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$5(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;

    move-result-object v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 207
    :cond_17
    return-void
.end method
