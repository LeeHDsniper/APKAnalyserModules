.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$3;
.super Ljava/lang/Object;
.source "AdobeUXAssetOneUpViewerActivity.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->registerLocalNofications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    .prologue
    .line 914
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 8
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 917
    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v3

    const-string v4, "assetURL"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 919
    .local v1, "assetGUID":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v3

    if-eqz v3, :cond_43

    .line 920
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v3

    iget v2, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->mNum:I

    .line 921
    .local v2, "num":I
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->count()I

    move-result v3

    if-ge v2, v3, :cond_3a

    .line 922
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 931
    .end local v2    # "num":I
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :goto_24
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 932
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    invoke-virtual {v3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->setCommentCount(Ljava/lang/String;)V

    .line 934
    :cond_39
    return-void

    .line 924
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .restart local v2    # "num":I
    :cond_3a
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    goto :goto_24

    .line 928
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v2    # "num":I
    :cond_43
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    goto :goto_24
.end method
