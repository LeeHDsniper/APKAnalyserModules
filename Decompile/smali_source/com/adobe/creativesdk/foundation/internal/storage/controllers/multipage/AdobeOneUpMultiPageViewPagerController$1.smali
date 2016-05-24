.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;
.super Ljava/lang/Object;
.source "AdobeOneUpMultiPageViewPagerController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
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
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

.field final synthetic val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 3
    .param p1, "requestResult"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->_mainRootView:Landroid/view/View;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_9

    .line 163
    :goto_8
    return-void

    .line 156
    :cond_9
    if-nez p1, :cond_11

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->handleNoPreview()V

    goto :goto_8

    .line 161
    :cond_11
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;)V

    goto :goto_8
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 150
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController$1;->onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method
