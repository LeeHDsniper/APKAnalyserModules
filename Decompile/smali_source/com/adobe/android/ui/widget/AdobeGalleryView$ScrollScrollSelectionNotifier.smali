.class Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;
.super Ljava/lang/Object;
.source "AdobeGalleryView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeGalleryView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollScrollSelectionNotifier"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1378
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget-boolean v0, v0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDataChanged:Z

    if-eqz v0, :cond_14

    .line 1379
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 1380
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->post(Ljava/lang/Runnable;)Z

    .line 1385
    :cond_13
    :goto_13
    return-void

    .line 1383
    :cond_14
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fireOnSelected()V

    goto :goto_13
.end method
