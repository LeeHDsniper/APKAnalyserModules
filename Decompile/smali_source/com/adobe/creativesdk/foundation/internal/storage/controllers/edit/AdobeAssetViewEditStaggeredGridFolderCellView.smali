.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;
.source "AdobeAssetViewEditStaggeredGridFolderCellView.java"


# instance fields
.field private _editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

.field private _newSelectionFrame:Landroid/view/View;

.field private isSelected:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->handleAssetSelectionToggle()V

    return-void
.end method

.method private handleAssetSelectionToggle()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;->getControllerState()Z

    move-result v0

    if-ne v0, v1, :cond_1c

    .line 54
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    if-ne v0, v1, :cond_1d

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    .line 58
    :goto_10
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->setImageMarkedUnMarked()V

    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->getPosition()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;->handleAssetSelectionToggle(I)V

    .line 61
    :cond_1c
    return-void

    .line 57
    :cond_1d
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    goto :goto_10
.end method

.method private setImageMarkedUnMarked()V
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_newSelectionFrame:Landroid/view/View;

    if-eqz v0, :cond_e

    .line 71
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_newSelectionFrame:Landroid/view/View;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    :goto_b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 72
    :cond_e
    return-void

    .line 71
    :cond_f
    const/16 v0, 0x8

    goto :goto_b
.end method


# virtual methods
.method protected handleDisableChange()V
    .registers 1

    .prologue
    .line 66
    return-void
.end method

.method protected handleOnFinishInflate()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 84
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->handleOnFinishInflate()V

    .line 85
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 86
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->getRootView()Landroid/view/View;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_foldercell_imageContainer:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 88
    .local v0, "container":Landroid/widget/RelativeLayout;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetcell_selection_fragme:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_newSelectionFrame:Landroid/view/View;

    .line 89
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_newSelectionFrame:Landroid/view/View;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_newSelectionFrame:Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 91
    return-void
.end method

.method protected handleSelection(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    .line 78
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->setImageMarkedUnMarked()V

    .line 79
    return-void
.end method

.method protected performOnFinishInflate()V
    .registers 3

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->getRootView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->performOnFinishInflate()V

    .line 49
    return-void
.end method

.method public prepareForReuse()V
    .registers 2

    .prologue
    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->isSelected:Z

    .line 29
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->prepareForReuse()V

    .line 30
    return-void
.end method

.method protected providesSelection()Z
    .registers 2

    .prologue
    .line 23
    const/4 v0, 0x0

    return v0
.end method

.method public setEditDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;)V
    .registers 2
    .param p1, "_editDelegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    .line 36
    return-void
.end method
