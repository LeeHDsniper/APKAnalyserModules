.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;
.source "AdobeAssetViewEditSectionalListFolderCellView.java"


# instance fields
.field private _editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

.field private _newSelectionFrame:Landroid/view/View;

.field private isSelected:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->handleAssetSelectionToggle()V

    return-void
.end method

.method private handleAssetSelectionToggle()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;->getControllerState()Z

    move-result v0

    if-ne v0, v1, :cond_1c

    .line 34
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    if-ne v0, v1, :cond_1d

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    .line 38
    :goto_10
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->setImageMarkedUnMarked()V

    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->getPosition()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;->handleAssetSelectionToggle(I)V

    .line 41
    :cond_1c
    return-void

    .line 37
    :cond_1d
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    goto :goto_10
.end method

.method private setImageMarkedUnMarked()V
    .registers 3

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_newSelectionFrame:Landroid/view/View;

    if-eqz v0, :cond_e

    .line 58
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_newSelectionFrame:Landroid/view/View;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    :goto_b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 59
    :cond_e
    return-void

    .line 58
    :cond_f
    const/16 v0, 0x8

    goto :goto_b
.end method


# virtual methods
.method protected handleOnFinishInflate()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 70
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->handleOnFinishInflate()V

    .line 71
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 72
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->getRootView()Landroid/view/View;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_foldercell_imagecontainer:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 74
    .local v0, "container":Landroid/widget/RelativeLayout;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetcell_selection_fragme:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_newSelectionFrame:Landroid/view/View;

    .line 75
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_newSelectionFrame:Landroid/view/View;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_newSelectionFrame:Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 77
    return-void
.end method

.method protected handleSelection(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    .line 65
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->setImageMarkedUnMarked()V

    .line 66
    return-void
.end method

.method protected performOnFinishInflate()V
    .registers 3

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->getRootView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->performOnFinishInflate()V

    .line 54
    return-void
.end method

.method public prepareForReuse()V
    .registers 2

    .prologue
    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->isSelected:Z

    .line 24
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->prepareForReuse()V

    .line 25
    return-void
.end method

.method public setEditDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;)V
    .registers 2
    .param p1, "_editDelegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    .line 30
    return-void
.end method
