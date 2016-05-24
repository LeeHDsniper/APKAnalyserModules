.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;
.super Ljava/lang/Object;
.source "AdobeCollaborationGenericCellView.java"


# instance fields
.field protected _mainRootView:Landroid/view/View;

.field protected isDeleteVisible:Z

.field protected isEnabled:Z

.field protected mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

.field private mDeleteButton:Landroid/view/View;

.field protected mDeleteName:Landroid/widget/TextView;

.field protected mDeleteView:Landroid/view/View;

.field protected mInfoView:Landroid/view/View;

.field protected mNameView:Landroid/widget/TextView;

.field private mPosition:I

.field protected mProfilePicture:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isDeleteVisible:Z

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled:Z

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->showDeleteView()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    .prologue
    .line 17
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mPosition:I

    return v0
.end method

.method private hideDeleteView()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mInfoView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 135
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDeleteView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 136
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isDeleteVisible:Z

    .line 137
    return-void
.end method

.method private isEnabled()Z
    .registers 2

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled:Z

    return v0
.end method

.method private performOnFinishInflate()V
    .registers 3

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_name:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mNameView:Landroid/widget/TextView;

    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_name_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mInfoView:Landroid/view/View;

    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mInfoView:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_profile_pic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mProfilePicture:Landroid/widget/ImageView;

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_delete_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDeleteView:Landroid/view/View;

    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_delete_textview:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDeleteName:Landroid/widget/TextView;

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_delete_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDeleteButton:Landroid/view/View;

    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDeleteButton:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    return-void
.end method

.method private showDeleteView()V
    .registers 3

    .prologue
    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mInfoView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDeleteView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isDeleteVisible:Z

    .line 131
    return-void
.end method


# virtual methods
.method protected getBoldString(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;
    .registers 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 142
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 143
    .local v0, "boldSpan":Landroid/text/style/StyleSpan;
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 144
    .local v1, "tempString":Landroid/text/SpannableStringBuilder;
    const/4 v2, 0x0

    const/16 v3, 0x21

    invoke-virtual {v1, v0, v2, p2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 145
    return-object v1
.end method

.method protected getPosition()I
    .registers 2

    .prologue
    .line 156
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mPosition:I

    return v0
.end method

.method protected getResourceString(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract handleDeleteClick()V
.end method

.method protected abstract initializeFromLayout(Landroid/view/View;)V
.end method

.method protected prepareForReuse()V
    .registers 3

    .prologue
    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mPosition:I

    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mProfilePicture:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled:Z

    .line 57
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->prepareForReuseUtil()V

    .line 58
    return-void
.end method

.method protected abstract prepareForReuseUtil()V
.end method

.method public setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    .line 74
    return-void
.end method

.method public setDeleteVisibility(Z)V
    .registers 3
    .param p1, "isVisible"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isDeleteVisible:Z

    .line 119
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isDeleteVisible:Z

    if-eqz v0, :cond_a

    .line 120
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->showDeleteView()V

    .line 125
    :goto_9
    return-void

    .line 123
    :cond_a
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->hideDeleteView()V

    goto :goto_9
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "isEnabled"    # Z

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled:Z

    .line 62
    return-void
.end method

.method protected setMainRootView(Landroid/view/View;)V
    .registers 2
    .param p1, "newView"    # Landroid/view/View;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->_mainRootView:Landroid/view/View;

    .line 41
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->performOnFinishInflate()V

    .line 42
    return-void
.end method

.method public setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mPosition:I

    .line 70
    return-void
.end method

.method protected abstract shouldShowDelete()Z
.end method
