.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "AdobeUploadErrorSummaryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field public _imageView:Landroid/widget/ImageView;

.field public _position:I

.field public _textView:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;)V
    .registers 3

    .prologue
    .line 159
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$ViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$ViewHolder;->_position:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$1;

    .prologue
    .line 159
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter$ViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment$UploadErrorDetailsListAdapter;)V

    return-void
.end method
