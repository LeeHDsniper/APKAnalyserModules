.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;
.source "AdobeAssetViewEditSectionalListViewAssetCellView.java"


# instance fields
.field private _editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

.field private _newSelectionFrame:Landroid/view/View;

.field private isSelected:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->isSelected:Z

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->handleAssetSelectionToggle()V

    return-void
.end method

.method private handleAssetSelectionToggle()V
    .registers 3

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;->getControllerState()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 50
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->isSelected:Z

    if-eqz v0, :cond_1c

    const/4 v0, 0x0

    :goto_d
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->isSelected:Z

    .line 51
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->setImageMarkedUnMarked()V

    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->getPosition()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;->handleAssetSelectionToggle(I)V

    .line 54
    :cond_1b
    return-void

    .line 50
    :cond_1c
    const/4 v0, 0x1

    goto :goto_d
.end method

.method private setImageMarkedUnMarked()V
    .registers 3

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_newSelectionFrame:Landroid/view/View;

    if-eqz v0, :cond_e

    .line 60
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_newSelectionFrame:Landroid/view/View;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->isSelected:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    :goto_b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 61
    :cond_e
    return-void

    .line 60
    :cond_f
    const/16 v0, 0x8

    goto :goto_b
.end method


# virtual methods
.method protected handleOnFinishInflate()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 72
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->handleOnFinishInflate()V

    .line 73
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 74
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->getRootView()Landroid/view/View;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_imagecontainer:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 76
    .local v0, "container":Landroid/widget/RelativeLayout;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetcell_selection_fragme:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_newSelectionFrame:Landroid/view/View;

    .line 77
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_newSelectionFrame:Landroid/view/View;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_newSelectionFrame:Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 79
    return-void
.end method

.method protected handleSelection(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->isSelected:Z

    .line 65
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->setImageMarkedUnMarked()V

    .line 66
    return-void
.end method

.method protected performOnFinishInflate()V
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->getRootView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->performOnFinishInflate()V

    .line 44
    return-void
.end method

.method public prepareForReuse()V
    .registers 2

    .prologue
    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->isSelected:Z

    .line 24
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->prepareForReuse()V

    .line 25
    return-void
.end method

.method public setEditDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;)V
    .registers 2
    .param p1, "_editDelegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->_editDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesEditDelegate;

    .line 31
    return-void
.end method
