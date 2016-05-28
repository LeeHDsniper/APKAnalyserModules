.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;
.source "AdobeAssetViewEditGridViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CCFilesAssetsEditStaggeredGridAdapater"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    .line 127
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;Landroid/content/Context;)V

    .line 128
    return-void
.end method


# virtual methods
.method protected bindAssetCellViewToAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V
    .registers 5
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p3, "position"    # I

    .prologue
    .line 189
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;->bindAssetCellViewToAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V

    .line 190
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    if-eqz v0, :cond_c

    .line 191
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    .end local p1    # "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->adjustSelectionFrame()V

    .line 192
    :cond_c
    return-void
.end method

.method protected createAssetFileCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 212
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;-><init>()V

    .line 214
    .local v0, "staggeredCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->getHostActivity()Landroid/app/Activity;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_generic_staggered_assetviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 216
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->setEditDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;)V

    .line 217
    return-object v0
.end method

.method protected createAssetFolderCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 222
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;-><init>()V

    .line 223
    .local v0, "staggeredGridFolderCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->getHostActivity()Landroid/app/Activity;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_assetsgrid_folderviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 225
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->setEditDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;)V

    .line 227
    return-object v0
.end method

.method protected getCellDataFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .registers 6
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    const/4 v3, 0x0

    .line 175
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;-><init>()V

    .line 176
    .local v0, "celldata":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->guid:Ljava/lang/String;

    .line 177
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->title:Ljava/lang/String;

    .line 178
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getModificationDate()Ljava/util/Date;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->modificationDate:Ljava/util/Date;

    .line 179
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getCreationDate()Ljava/util/Date;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->creationDate:Ljava/util/Date;

    .line 180
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 181
    .local v1, "isAssetFile":Z
    if-eqz v1, :cond_3c

    move-object v2, p1

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v2

    :goto_29
    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->optionalMetadata:Lorg/json/JSONObject;

    .line 182
    if-eqz v1, :cond_34

    move-object v2, p1

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getMd5Hash()Ljava/lang/String;

    move-result-object v3

    :cond_34
    iput-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->imageMD5Hash:Ljava/lang/String;

    .line 183
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->originalAsset:Ljava/lang/Object;

    .line 184
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->isSelected:Z

    .line 185
    return-object v0

    :cond_3c
    move-object v2, v3

    .line 181
    goto :goto_29
.end method

.method public getControllerState()Z
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->controllerState()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;)Z

    move-result v0

    return v0
.end method

.method public handleAssetSelectionToggle(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->getAssetItemData(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;

    .line 154
    .local v0, "cellAssetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    iget-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 157
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->isSelected:Z

    .line 158
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->addSelectedAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)V
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)V

    .line 166
    :goto_1a
    return-void

    .line 162
    :cond_1b
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->isSelected:Z

    .line 163
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;->guid:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->removeSelectedAsset(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Ljava/lang/String;)V

    goto :goto_1a
.end method

.method protected handlePostCellViewBinding(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V
    .registers 7
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p3, "position"    # I

    .prologue
    .line 196
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;->handlePostCellViewBinding(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V

    .line 197
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    if-eqz v1, :cond_1d

    .line 199
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z

    move-result v0

    .local v0, "isSelected":Z
    move-object v1, p1

    .line 200
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->handleSelection(Z)V

    move-object v1, p1

    .line 201
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->adjustSelectionFrame()V

    .line 203
    .end local v0    # "isSelected":Z
    :cond_1d
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    if-eqz v1, :cond_30

    .line 205
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z

    move-result v0

    .line 206
    .restart local v0    # "isSelected":Z
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    .end local p1    # "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->handleSelection(Z)V

    .line 208
    .end local v0    # "isSelected":Z
    :cond_30
    return-void
.end method

.method protected isAssetCellViewAlreadyRepresentAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 7
    .param p1, "assetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 132
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;->isAssetCellViewAlreadyRepresentAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z

    move-result v0

    .line 133
    .local v0, "value":Z
    const/4 v1, 0x1

    if-ne v0, v1, :cond_24

    .line 135
    instance-of v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditCellAssetData;

    if-eqz v1, :cond_24

    .line 137
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    if-eqz v1, :cond_25

    move-object v1, p1

    .line 138
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z
    invoke-static {v3, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->handleSelection(Z)V

    .line 139
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    .end local p1    # "assetCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->adjustSelectionFrame()V

    .line 146
    :cond_24
    :goto_24
    return v0

    .line 141
    .restart local p1    # "assetCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    :cond_25
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    if-eqz v1, :cond_24

    .line 142
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    .end local p1    # "assetCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController$CCFilesAssetsEditStaggeredGridAdapater;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Z

    move-result v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->handleSelection(Z)V

    goto :goto_24
.end method
