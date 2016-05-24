.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AdobeEditErrorSummaryFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;
    }
.end annotation


# static fields
.field public static ERROR_LIST_KEY:Ljava/lang/String;


# instance fields
.field private _edit_failed_assets_listview:Landroid/widget/ListView;

.field private _failedAssetsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "errorlist_key"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->ERROR_LIST_KEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->_failedAssetsList:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const/4 v0, 0x1

    .line 54
    .local v0, "style":I
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->setStyle(II)V

    .line 55
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 14
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 62
    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_edit_error_details_dialog:I

    invoke-virtual {p1, v5, p2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 64
    .local v1, "mainDialogView":Landroid/view/View;
    const/16 v5, 0x8

    new-array v2, v5, [F

    .line 65
    .local v2, "radii":[F
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->fragment_detail_footer_border_left_radius:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    .line 66
    .local v3, "radius":F
    const/4 v5, 0x1

    const/4 v6, 0x2

    const/4 v7, 0x3

    aput v3, v2, v7

    aput v3, v2, v6

    aput v3, v2, v5

    aput v3, v2, v8

    .line 68
    new-instance v4, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v5, Landroid/graphics/drawable/shapes/RoundRectShape;

    invoke-direct {v5, v2, v9, v9}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 69
    .local v4, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v4}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_edit_error_detials_main_list:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->_edit_failed_assets_listview:Landroid/widget/ListView;

    .line 75
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->_failedAssetsList:Ljava/util/ArrayList;

    if-eqz v5, :cond_5a

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    if-eqz v5, :cond_5a

    .line 76
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_upload_failed_assets_list_item:I

    invoke-direct {v0, p0, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;Landroid/content/Context;I)V

    .line 77
    .local v0, "listAdapter":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->_edit_failed_assets_listview:Landroid/widget/ListView;

    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 81
    .end local v0    # "listAdapter":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment$EditErrorDetailsListAdapter;
    :cond_5a
    return-object v1
.end method

.method public setEditFailedList(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "failedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->_failedAssetsList:Ljava/util/ArrayList;

    .line 48
    return-void
.end method
