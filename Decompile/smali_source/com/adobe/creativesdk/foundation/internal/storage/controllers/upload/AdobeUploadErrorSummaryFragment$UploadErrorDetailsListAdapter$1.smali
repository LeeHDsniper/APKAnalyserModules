.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$1;
.super Ljava/lang/Object;
.source "AdobeUploadErrorSummaryFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
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
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;

.field final synthetic val$imageViewOfCell:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;Landroid/widget/ImageView;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$1;->val$imageViewOfCell:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "requestResult"    # Landroid/graphics/Bitmap;

    .prologue
    .line 150
    if-eqz p1, :cond_7

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$1;->val$imageViewOfCell:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 152
    :cond_7
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 147
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$1;->onCompletion(Landroid/graphics/Bitmap;)V

    return-void
.end method
