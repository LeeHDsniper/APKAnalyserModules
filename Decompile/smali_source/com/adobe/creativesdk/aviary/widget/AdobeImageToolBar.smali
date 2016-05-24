.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;
.super Landroid/support/v7/widget/Toolbar;
.source "AdobeImageToolBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarDoneEvent;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarApplyEvent;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;
    }
.end annotation


# instance fields
.field private mApplyButton:Landroid/widget/ImageButton;

.field private mDoneButton:Landroid/widget/Button;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

.field private mTextSwitcher:Landroid/widget/TextSwitcher;

.field private mToolbarSwitcher:Landroid/widget/ViewSwitcher;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/Toolbar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->init(Landroid/content/Context;)V

    .line 43
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;->Close:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->current:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;->Close:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->previous:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    .line 49
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->closed()Z

    move-result v0

    if-nez v0, :cond_13

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;->Close:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->setCurrent(Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;)V

    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mToolbarSwitcher:Landroid/widget/ViewSwitcher;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 105
    :cond_13
    return-void
.end method

.method public closed()Z
    .registers 3

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->current:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;->Close:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public getApplyProgressVisible()Z
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public makeView()Landroid/view/View;
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_toolbar_title_textview:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 152
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 154
    .local v0, "id":I
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    if-ne v0, v1, :cond_15

    .line 156
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarDoneEvent;

    invoke-direct {v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarDoneEvent;-><init>()V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 161
    :cond_14
    :goto_14
    return-void

    .line 157
    :cond_15
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    if-ne v0, v1, :cond_14

    .line 159
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarApplyEvent;

    invoke-direct {v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarApplyEvent;-><init>()V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_14
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 53
    invoke-super {p0}, Landroid/support/v7/widget/Toolbar;->onFinishInflate()V

    .line 55
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->com_adobe_image_toolbar_switcher:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewSwitcher;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mToolbarSwitcher:Landroid/widget/ViewSwitcher;

    .line 56
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mDoneButton:Landroid/widget/Button;

    .line 57
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mApplyButton:Landroid/widget/ImageButton;

    .line 58
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->com_adobe_image_toolbar_text_switcher:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextSwitcher;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    .line 59
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->com_adobe_image_toolbar_progress:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mProgressBar:Landroid/widget/ProgressBar;

    .line 61
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v0, p0}, Landroid/widget/TextSwitcher;->setFactory(Landroid/widget/ViewSwitcher$ViewFactory;)V

    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mDoneButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mApplyButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    return-void
.end method

.method public open()V
    .registers 3

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->opened()Z

    move-result v0

    if-nez v0, :cond_13

    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;->Open:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->setCurrent(Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;)V

    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mToolbarSwitcher:Landroid/widget/ViewSwitcher;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 98
    :cond_13
    return-void
.end method

.method public opened()Z
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mStatus:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->current:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;->Open:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public setApplyEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 116
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mApplyButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 117
    return-void
.end method

.method public setApplyProgressVisible(Z)V
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 132
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 133
    return-void

    .line 132
    :cond_9
    const/4 v0, 0x4

    goto :goto_5
.end method

.method public setApplyVisible(Z)V
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 120
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mApplyButton:Landroid/widget/ImageButton;

    if-eqz p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 121
    return-void

    .line 120
    :cond_9
    const/4 v0, 0x4

    goto :goto_5
.end method

.method public setClickable(Z)V
    .registers 3
    .param p1, "clickable"    # Z

    .prologue
    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mDoneButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setClickable(Z)V

    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mApplyButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 139
    return-void
.end method

.method public setDoneEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mDoneButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 125
    return-void
.end method

.method public setTint(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-static {v0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setIndeterminateProgressBarTint(Landroid/widget/ProgressBar;I)Z

    .line 143
    return-void
.end method

.method public setTitle(I)V
    .registers 3
    .param p1, "resourceId"    # I

    .prologue
    .line 86
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(IZ)V

    .line 87
    return-void
.end method

.method public setTitle(IZ)V
    .registers 4
    .param p1, "resourceId"    # I
    .param p2, "animate"    # Z

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(Ljava/lang/CharSequence;Z)V

    .line 91
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 68
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(Ljava/lang/CharSequence;Z)V

    .line 69
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;Z)V
    .registers 7
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "animate"    # Z

    .prologue
    const/4 v3, 0x0

    .line 72
    if-nez p2, :cond_29

    .line 73
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2}, Landroid/widget/TextSwitcher;->getInAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    .line 74
    .local v0, "inAnimation":Landroid/view/animation/Animation;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2}, Landroid/widget/TextSwitcher;->getOutAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    .line 75
    .local v1, "outAnimation":Landroid/view/animation/Animation;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2, v3}, Landroid/widget/TextSwitcher;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 76
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2, v3}, Landroid/widget/TextSwitcher;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 77
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2, p1}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2, v0}, Landroid/widget/TextSwitcher;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 79
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2, v1}, Landroid/widget/TextSwitcher;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 83
    .end local v0    # "inAnimation":Landroid/view/animation/Animation;
    .end local v1    # "outAnimation":Landroid/view/animation/Animation;
    :goto_28
    return-void

    .line 81
    :cond_29
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->mTextSwitcher:Landroid/widget/TextSwitcher;

    invoke-virtual {v2, p1}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    goto :goto_28
.end method
