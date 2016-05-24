.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;
.super Ljava/lang/Object;
.source "AdobeUXLibraryItemCollectionOneUpViewerActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setupLibraryImageCollectionView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

.field final synthetic val$photoZoomView:Luk/co/senab/photoview/PhotoView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;Luk/co/senab/photoview/PhotoView;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    .prologue
    .line 537
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->val$photoZoomView:Luk/co/senab/photoview/PhotoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/Bitmap;)V
    .registers 9
    .param p1, "renditionBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, -0x1

    const/4 v5, -0x2

    .line 541
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    if-nez v3, :cond_b

    .line 589
    :cond_a
    :goto_a
    return-void

    .line 544
    :cond_b
    if-nez p1, :cond_19

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    if-nez v3, :cond_19

    .line 546
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->handleNoImageItemPreview()V
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;)V

    goto :goto_a

    .line 549
    :cond_19
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    if-eqz v3, :cond_37

    .line 551
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iget-object v4, v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    iget v4, v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;->_currentImageWidth:I

    if-le v3, v4, :cond_a

    .line 552
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iget-object v4, v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    iget v4, v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;->_currentImageHeight:I

    if-le v3, v4, :cond_a

    .line 557
    :cond_37
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->visibilityhandler_isOnLine()V

    .line 558
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    invoke-direct {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;-><init>()V

    iput-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    .line 559
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iput v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;->_currentImageWidth:I

    .line 560
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iput v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;->_currentImageHeight:I

    .line 562
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 564
    .local v1, "displayMetrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget v4, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lt v3, v4, :cond_73

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget v4, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v3, v4, :cond_9c

    .line 565
    :cond_73
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 573
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_78
    const/16 v3, 0xd

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 574
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->val$photoZoomView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v3, v2}, Luk/co/senab/photoview/PhotoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 575
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->val$photoZoomView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 577
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    const/4 v4, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setSpinnerVisibility(Z)V
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;Z)V

    .line 585
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .line 586
    .local v0, "activity":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
    if-eqz v0, :cond_a

    .line 588
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->generateShareIntentInfo()V

    goto/16 :goto_a

    .line 569
    .end local v0    # "activity":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
    .end local v2    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_9c
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v2    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    goto :goto_78
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 537
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;->onCompletion(Landroid/graphics/Bitmap;)V

    return-void
.end method
