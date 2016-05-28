.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsCellView.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;


# instance fields
.field private _mainDataView:Landroid/view/View;

.field protected _mainRootView:Landroid/view/View;

.field private commentURL:Ljava/lang/String;

.field private deleteViewWidth:I

.field protected isDeleteVisible:Z

.field private isEnabled:Z

.field private isSwiping:Z

.field private listener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;

.field protected mCommentContent:Landroid/widget/TextView;

.field protected mDateOfComment:Landroid/widget/TextView;

.field protected mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

.field protected mDeleteView:Landroid/view/View;

.field private mDeleteViewWidth:F

.field protected mInfoView:Landroid/view/View;

.field protected mNameView:Landroid/widget/TextView;

.field private mPosition:I

.field protected mProfilePicture:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isDeleteVisible:Z

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDeleteViewWidth:F

    .line 38
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isSwiping:Z

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isEnabled:Z

    .line 41
    const/16 v0, 0x3c

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->deleteViewWidth:I

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isSwiping:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isEnabled:Z

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->handleDeleteClick()V

    return-void
.end method

.method private disableCellView()V
    .registers 3

    .prologue
    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    const v1, 0x3ecccccd

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 73
    return-void
.end method

.method private enableCellView()V
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    const/high16 v1, 0x3f800000

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 68
    return-void
.end method

.method private getBoldString(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;
    .registers 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 141
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 142
    .local v0, "boldSpan":Landroid/text/style/StyleSpan;
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 143
    .local v1, "tempString":Landroid/text/SpannableStringBuilder;
    const/4 v2, 0x0

    const/16 v3, 0x21

    invoke-virtual {v1, v0, v2, p2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 144
    return-object v1
.end method

.method private getDeleteViewWidth()F
    .registers 4

    .prologue
    .line 86
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDeleteViewWidth:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_21

    .line 87
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 88
    .local v0, "density":F
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->deleteViewWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    .line 90
    .end local v0    # "density":F
    :goto_20
    return v1

    :cond_21
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDeleteViewWidth:F

    goto :goto_20
.end method

.method private handleDeleteClick()V
    .registers 4

    .prologue
    .line 165
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->disableCellView()V

    .line 166
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isEnabled:Z

    .line 167
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    if-eqz v0, :cond_1e

    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    const/4 v1, -0x1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setToken(I)V

    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->commentURL:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->deleteComment(Ljava/lang/String;I)V

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->setDeleteInvisible()V

    .line 172
    :cond_1e
    return-void
.end method

.method private performOnFinishInflate()V
    .registers 3

    .prologue
    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_commenter_name:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mNameView:Landroid/widget/TextView;

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_comment_content_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mInfoView:Landroid/view/View;

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_comment_date:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDateOfComment:Landroid/widget/TextView;

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_comments_content:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mCommentContent:Landroid/widget/TextView;

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_comment_content_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_commenter_profile_pic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mProfilePicture:Landroid/widget/ImageView;

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_comment_delete_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDeleteView:Landroid/view/View;

    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDeleteView:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    return-void
.end method


# virtual methods
.method public canSwipe()Z
    .registers 5

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isEnabled:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->isCellSwiping()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1f

    :cond_10
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->isCellSwiping()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getPosition()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_21

    .line 260
    :cond_1f
    const/4 v0, 0x1

    .line 262
    :goto_20
    return v0

    :cond_21
    const/4 v0, 0x0

    goto :goto_20
.end method

.method protected createSwipeListener()V
    .registers 4

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    if-eqz v0, :cond_19

    .line 95
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getDeleteViewWidth()F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v0, v1, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;-><init>(Landroid/view/View;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->listener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;

    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->listener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 98
    :cond_19
    return-void
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 128
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mPosition:I

    return v0
.end method

.method public handleDeleteVisibility(ZZ)V
    .registers 5
    .param p1, "isDeleteVisible"    # Z
    .param p2, "isFromSwiping"    # Z

    .prologue
    .line 244
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isSwiping:Z

    .line 245
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isDeleteVisible:Z

    .line 246
    const/4 v0, 0x1

    if-ne p1, v0, :cond_17

    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setDeleteVisibilityDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;)V

    .line 249
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getPosition()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setToken(I)V

    .line 255
    :cond_16
    :goto_16
    return-void

    .line 252
    :cond_17
    if-eqz p2, :cond_16

    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    const/4 v1, -0x1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setToken(I)V

    goto :goto_16
.end method

.method public hideDeleteButton()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 46
    iput-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isDeleteVisible:Z

    .line 47
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    if-eqz v1, :cond_1d

    .line 48
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    const-string v2, "x"

    const/4 v3, 0x1

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v4, v3, v5

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 49
    .local v0, "animator":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0x32

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 50
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 52
    .end local v0    # "animator":Landroid/animation/ObjectAnimator;
    :cond_1d
    return-void
.end method

.method protected initializeFromLayout(Landroid/view/View;)V
    .registers 2
    .param p1, "newView"    # Landroid/view/View;

    .prologue
    .line 176
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->setMainRootView(Landroid/view/View;)V

    .line 177
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->performOnFinishInflate()V

    .line 178
    return-void
.end method

.method public isSwiping()Z
    .registers 2

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isSwiping:Z

    return v0
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 220
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isDeleteVisible:Z

    return v0
.end method

.method protected prepareForReuse()V
    .registers 3

    .prologue
    .line 101
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mPosition:I

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mProfilePicture:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 103
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->setDeleteInvisible()V

    .line 104
    return-void
.end method

.method public setCommentContent(Ljava/lang/String;)V
    .registers 4
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mCommentContent:Landroid/widget/TextView;

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    return-void
.end method

.method public setCommentDate(Ljava/lang/String;)V
    .registers 3
    .param p1, "date"    # Ljava/lang/String;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDateOfComment:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    return-void
.end method

.method public setCommentURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "commentURL"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->commentURL:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setCommenterName(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mNameView:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getBoldString(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    return-void
.end method

.method public setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    .line 112
    return-void
.end method

.method public setDeleteInvisible()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 234
    iput-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isDeleteVisible:Z

    .line 235
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    if-eqz v1, :cond_1d

    .line 236
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    const-string v2, "x"

    const/4 v3, 0x1

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v4, v3, v5

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 237
    .local v0, "animator":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 238
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 240
    .end local v0    # "animator":Landroid/animation/ObjectAnimator;
    :cond_1d
    return-void
.end method

.method public setDeleteVisible()V
    .registers 7

    .prologue
    const/4 v3, 0x1

    .line 225
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isDeleteVisible:Z

    .line 226
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    if-eqz v1, :cond_21

    .line 227
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainDataView:Landroid/view/View;

    const-string v2, "x"

    new-array v3, v3, [F

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getDeleteViewWidth()F

    move-result v5

    neg-float v5, v5

    aput v5, v3, v4

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 228
    .local v0, "animator":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 229
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 231
    .end local v0    # "animator":Landroid/animation/ObjectAnimator;
    :cond_21
    return-void
.end method

.method public setIsEnabled(Z)V
    .registers 2
    .param p1, "isEnabled"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isEnabled:Z

    .line 57
    if-nez p1, :cond_8

    .line 59
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->disableCellView()V

    .line 63
    :goto_7
    return-void

    .line 62
    :cond_8
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->enableCellView()V

    goto :goto_7
.end method

.method protected setMainRootView(Landroid/view/View;)V
    .registers 2
    .param p1, "newView"    # Landroid/view/View;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->_mainRootView:Landroid/view/View;

    .line 82
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->performOnFinishInflate()V

    .line 83
    return-void
.end method

.method public setNoImage(I)V
    .registers 4
    .param p1, "cellPosition"    # I

    .prologue
    .line 194
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getPosition()I

    move-result v0

    if-ne v0, p1, :cond_14

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mProfilePicture:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mProfilePicture:Landroid/widget/ImageView;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->adobe_place_holder_image:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 198
    :cond_14
    return-void
.end method

.method public setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 107
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mPosition:I

    .line 108
    return-void
.end method

.method public setProfilePicture(Landroid/graphics/Bitmap;I)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "position"    # I

    .prologue
    .line 201
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getPosition()I

    move-result v0

    if-ne v0, p2, :cond_12

    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mProfilePicture:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mProfilePicture:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 205
    :cond_12
    return-void
.end method

.method public startedSwiping()V
    .registers 5

    .prologue
    const/4 v1, -0x1

    .line 182
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    if-eqz v0, :cond_24

    .line 183
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->handleDeleteVisibility(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;)V

    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->getToken()I

    move-result v0

    if-eq v0, v1, :cond_1a

    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isSwiping:Z

    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setToken(I)V

    .line 188
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->getPosition()I

    move-result v1

    int-to-long v2, v1

    invoke-interface {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setCellSwiping(J)V

    .line 190
    :cond_24
    return-void
.end method

.method public stoppedSwiping()V
    .registers 5

    .prologue
    .line 209
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->isSwiping:Z

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;

    const-wide/16 v2, -0x1

    invoke-interface {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;->setCellSwiping(J)V

    .line 211
    return-void
.end method
