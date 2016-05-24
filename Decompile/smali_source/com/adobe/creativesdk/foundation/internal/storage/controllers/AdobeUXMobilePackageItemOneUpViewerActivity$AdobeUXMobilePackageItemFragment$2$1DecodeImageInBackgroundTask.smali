.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;
.super Landroid/os/AsyncTask;
.source "AdobeUXMobilePackageItemOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->onCompletion([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DecodeImageInBackgroundTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<[B",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    .prologue
    .line 504
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([[B)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "dateBytes"    # [[B

    .prologue
    const/4 v3, 0x0

    .line 507
    aget-object v1, p1, v3

    .line 508
    .local v1, "data":[B
    if-eqz v1, :cond_b

    .line 509
    array-length v2, v1

    invoke-static {v1, v3, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 512
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 504
    check-cast p1, [[B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->doInBackground([[B)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 8
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v5, -0x1

    const/4 v4, -0x2

    .line 516
    if-eqz p1, :cond_b3

    .line 517
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    if-nez v2, :cond_f

    .line 557
    :cond_e
    :goto_e
    return-void

    .line 520
    :cond_f
    if-nez p1, :cond_21

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    if-nez v2, :cond_21

    .line 521
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->handleNoImageItemPreview()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)V

    goto :goto_e

    .line 525
    :cond_21
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    if-eqz v2, :cond_45

    .line 527
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    iget v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;->_currentImageWidth:I

    if-le v2, v3, :cond_e

    .line 528
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    iget v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;->_currentImageHeight:I

    if-le v2, v3, :cond_e

    .line 533
    :cond_45
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->visibilityhandler_isOnLine()V

    .line 534
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;-><init>()V

    iput-object v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    .line 535
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iput v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;->_currentImageWidth:I

    .line 536
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iput v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;->_currentImageHeight:I

    .line 538
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 540
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lt v2, v3, :cond_8b

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v2, v3, :cond_ad

    .line 541
    :cond_8b
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 549
    .local v1, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_90
    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 550
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->val$photoZoomView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2, v1}, Luk/co/senab/photoview/PhotoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 551
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->val$photoZoomView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 552
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    const/4 v3, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setSpinnerVisibility(Z)V
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;Z)V

    goto/16 :goto_e

    .line 545
    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_ad
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    goto :goto_90

    .line 555
    .end local v0    # "displayMetrics":Landroid/util/DisplayMetrics;
    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_b3
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "AdobeMobileCreations:OneUpView"

    const-string v4, "Decoding data"

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_e
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 504
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2$1DecodeImageInBackgroundTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
