.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "AdobeEditErrorSummaryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field public _imageView:Landroid/widget/ImageView;

.field public _position:I

.field public _textView:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;)V
    .registers 3

    .prologue
    .line 202
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter$ViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter$ViewHolder;->_position:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$1;

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter$ViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;)V

    return-void
.end method
