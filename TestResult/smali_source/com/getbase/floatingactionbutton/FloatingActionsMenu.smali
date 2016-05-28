.class public Lcom/getbase/floatingactionbutton/FloatingActionsMenu;
.super Landroid/view/ViewGroup;
.source "FloatingActionsMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;,
        Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;,
        Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;,
        Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;
    }
.end annotation


# static fields
.field private static sAlphaExpandInterpolator:Landroid/view/animation/Interpolator;

.field private static sCollapseInterpolator:Landroid/view/animation/Interpolator;

.field private static sExpandInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

.field private mAddButtonColorNormal:I

.field private mAddButtonColorPressed:I

.field private mAddButtonPlusColor:I

.field private mAddButtonSize:I

.field private mAddButtonStrokeVisible:Z

.field private mButtonSpacing:I

.field private mButtonsCount:I

.field private mCollapseAnimation:Landroid/animation/AnimatorSet;

.field private mExpandAnimation:Landroid/animation/AnimatorSet;

.field private mExpandDirection:I

.field private mExpanded:Z

.field private mLabelsMargin:I

.field private mLabelsPosition:I

.field private mLabelsStyle:I

.field private mLabelsVerticalOffset:I

.field private mListener:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

.field private mMaxButtonHeight:I

.field private mMaxButtonWidth:I

.field private mRotatingDrawable:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

.field private mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 422
    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v0}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    sput-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->sExpandInterpolator:Landroid/view/animation/Interpolator;

    .line 423
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x40400000

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    sput-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->sCollapseInterpolator:Landroid/view/animation/Interpolator;

    .line 424
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->sAlphaExpandInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const-wide/16 v2, 0x12c

    .line 75
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandAnimation:Landroid/animation/AnimatorSet;

    .line 52
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mCollapseAnimation:Landroid/animation/AnimatorSet;

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const-wide/16 v2, 0x12c

    .line 80
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandAnimation:Landroid/animation/AnimatorSet;

    .line 52
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mCollapseAnimation:Landroid/animation/AnimatorSet;

    .line 81
    invoke-direct {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonPlusColor:I

    return v0
.end method

.method static synthetic access$100(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonColorNormal:I

    return v0
.end method

.method static synthetic access$1000()Landroid/view/animation/Interpolator;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->sAlphaExpandInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$1100()Landroid/view/animation/Interpolator;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->sCollapseInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    return v0
.end method

.method static synthetic access$200(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonColorPressed:I

    return v0
.end method

.method static synthetic access$300(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)Z
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonStrokeVisible:Z

    return v0
.end method

.method static synthetic access$402(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;)Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;
    .param p1, "x1"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mRotatingDrawable:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

    return-object p1
.end method

.method static synthetic access$500(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)Landroid/animation/AnimatorSet;
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandAnimation:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic access$600(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)Landroid/animation/AnimatorSet;
    .registers 2
    .param p0, "x0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mCollapseAnimation:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic access$900()Landroid/view/animation/Interpolator;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->sExpandInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method private adjustForOvershoot(I)I
    .registers 3
    .param p1, "dimension"    # I

    .prologue
    .line 269
    mul-int/lit8 v0, p1, 0xc

    div-int/lit8 v0, v0, 0xa

    return v0
.end method

.method private createAddButton(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 146
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;

    invoke-direct {v0, p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;-><init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    .line 176
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    sget v1, Lcom/getbase/floatingactionbutton/R$id;->fab_expand_menu_button:I

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->setId(I)V

    .line 177
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonSize:I

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->setSize(I)V

    .line 178
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    new-instance v1, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$2;

    invoke-direct {v1, p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$2;-><init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)V

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    invoke-super {p0}, Landroid/view/ViewGroup;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    return-void
.end method

.method private createLabels()V
    .registers 8

    .prologue
    .line 492
    new-instance v1, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsStyle:I

    invoke-direct {v1, v5, v6}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 494
    .local v1, "context":Landroid/content/Context;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    iget v5, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonsCount:I

    if-ge v2, v5, :cond_49

    .line 495
    invoke-virtual {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/getbase/floatingactionbutton/FloatingActionButton;

    .line 496
    .local v0, "button":Lcom/getbase/floatingactionbutton/FloatingActionButton;
    invoke-virtual {v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getTitle()Ljava/lang/String;

    move-result-object v4

    .line 498
    .local v4, "title":Ljava/lang/String;
    iget-object v5, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    if-eq v0, v5, :cond_28

    if-eqz v4, :cond_28

    sget v5, Lcom/getbase/floatingactionbutton/R$id;->fab_label:I

    .line 499
    invoke-virtual {v0, v5}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2b

    .line 494
    :cond_28
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 501
    :cond_2b
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 502
    .local v3, "label":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsStyle:I

    invoke-virtual {v3, v5, v6}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 503
    invoke-virtual {v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 504
    invoke-virtual {p0, v3}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->addView(Landroid/view/View;)V

    .line 506
    sget v5, Lcom/getbase/floatingactionbutton/R$id;->fab_label:I

    invoke-virtual {v0, v5, v3}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setTag(ILjava/lang/Object;)V

    goto :goto_28

    .line 508
    .end local v0    # "button":Lcom/getbase/floatingactionbutton/FloatingActionButton;
    .end local v3    # "label":Landroid/widget/TextView;
    .end local v4    # "title":Ljava/lang/String;
    :cond_49
    return-void
.end method

.method private expandsHorizontally()Z
    .registers 3

    .prologue
    .line 115
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private getColor(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 204
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 85
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/getbase/floatingactionbutton/R$dimen;->fab_actions_spacing:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/getbase/floatingactionbutton/R$dimen;->fab_shadow_radius:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/getbase/floatingactionbutton/R$dimen;->fab_shadow_offset:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    .line 86
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/getbase/floatingactionbutton/R$dimen;->fab_labels_margin:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsMargin:I

    .line 87
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/getbase/floatingactionbutton/R$dimen;->fab_shadow_offset:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsVerticalOffset:I

    .line 89
    new-instance v1, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    invoke-direct {v1, p0}, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    .line 90
    iget-object v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 92
    sget-object v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu:[I

    invoke-virtual {p1, p2, v1, v4, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 93
    .local v0, "attr":Landroid/content/res/TypedArray;
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_addButtonPlusIconColor:I

    const v2, 0x106000b

    invoke-direct {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonPlusColor:I

    .line 94
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_addButtonColorNormal:I

    const v2, 0x1060013

    invoke-direct {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonColorNormal:I

    .line 95
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_addButtonColorPressed:I

    const v2, 0x1060012

    invoke-direct {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonColorPressed:I

    .line 96
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_addButtonSize:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonSize:I

    .line 97
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_addButtonStrokeVisible:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonStrokeVisible:Z

    .line 98
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_expandDirection:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    .line 99
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_labelStyle:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsStyle:I

    .line 100
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu_fab_labelsPosition:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsPosition:I

    .line 101
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 103
    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsStyle:I

    if-eqz v1, :cond_b9

    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->expandsHorizontally()Z

    move-result v1

    if-eqz v1, :cond_b9

    .line 104
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Action labels in horizontal expand orientation is not supported."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :cond_b9
    invoke-direct {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->createAddButton(Landroid/content/Context;)V

    .line 108
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 419
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    return v0
.end method

.method public collapse()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 511
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    if-eqz v0, :cond_1f

    .line 512
    iput-boolean v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    .line 513
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->setEnabled(Z)V

    .line 514
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mCollapseAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 515
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 517
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mListener:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

    if-eqz v0, :cond_1f

    .line 518
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mListener:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

    invoke-interface {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;->onMenuCollapsed()V

    .line 521
    :cond_1f
    return-void
.end method

.method public expand()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 532
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    if-nez v0, :cond_1f

    .line 533
    iput-boolean v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    .line 534
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->setEnabled(Z)V

    .line 535
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mCollapseAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 536
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 538
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mListener:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

    if-eqz v0, :cond_1f

    .line 539
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mListener:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

    invoke-interface {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;->onMenuExpanded()V

    .line 542
    :cond_1f
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .prologue
    .line 404
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;

    invoke-super {p0}, Landroid/view/ViewGroup;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;-><init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 409
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;-><init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 414
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;-><init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public isExpanded()Z
    .registers 2

    .prologue
    .line 545
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    return v0
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 481
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 483
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->bringChildToFront(Landroid/view/View;)V

    .line 484
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildCount()I

    move-result v0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonsCount:I

    .line 486
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsStyle:I

    if-eqz v0, :cond_15

    .line 487
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->createLabels()V

    .line 489
    :cond_15
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 41
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 274
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    move/from16 v30, v0

    packed-switch v30, :pswitch_data_40c

    .line 400
    :cond_9
    return-void

    .line 277
    :pswitch_a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    move/from16 v30, v0

    if-nez v30, :cond_c6

    const/4 v15, 0x1

    .line 279
    .local v15, "expandUp":Z
    :goto_13
    if-eqz p1, :cond_1e

    .line 280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->clearTouchDelegates()V

    .line 283
    :cond_1e
    if-eqz v15, :cond_c9

    sub-int v30, p5, p3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredHeight()I

    move-result v31

    sub-int v8, v30, v31

    .line 285
    .local v8, "addButtonY":I
    :goto_2e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsPosition:I

    move/from16 v30, v0

    if-nez v30, :cond_cc

    sub-int v30, p4, p2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    move/from16 v31, v0

    div-int/lit8 v31, v31, 0x2

    sub-int v9, v30, v31

    .line 288
    .local v9, "buttonsHorizontalCenter":I
    :goto_42
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredWidth()I

    move-result v30

    div-int/lit8 v30, v30, 0x2

    sub-int v5, v9, v30

    .line 289
    .local v5, "addButtonLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredWidth()I

    move-result v31

    add-int v31, v31, v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredHeight()I

    move-result v32

    add-int v32, v32, v8

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v5, v8, v1, v2}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->layout(IIII)V

    .line 291
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    move/from16 v30, v0

    div-int/lit8 v30, v30, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsMargin:I

    move/from16 v31, v0

    add-int v24, v30, v31

    .line 292
    .local v24, "labelsOffset":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsPosition:I

    move/from16 v30, v0

    if-nez v30, :cond_d6

    sub-int v25, v9, v24

    .line 296
    .local v25, "labelsXNearButton":I
    :goto_91
    if-eqz v15, :cond_d9

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v30, v0

    sub-int v27, v8, v30

    .line 300
    .local v27, "nextY":I
    :goto_9b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonsCount:I

    move/from16 v30, v0

    add-int/lit8 v17, v30, -0x1

    .local v17, "i":I
    :goto_a3
    if-ltz v17, :cond_9

    .line 301
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 303
    .local v10, "child":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    if-eq v10, v0, :cond_c3

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v30

    const/16 v31, 0x8

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_ee

    .line 300
    :cond_c3
    :goto_c3
    add-int/lit8 v17, v17, -0x1

    goto :goto_a3

    .line 277
    .end local v5    # "addButtonLeft":I
    .end local v8    # "addButtonY":I
    .end local v9    # "buttonsHorizontalCenter":I
    .end local v10    # "child":Landroid/view/View;
    .end local v15    # "expandUp":Z
    .end local v17    # "i":I
    .end local v24    # "labelsOffset":I
    .end local v25    # "labelsXNearButton":I
    .end local v27    # "nextY":I
    :cond_c6
    const/4 v15, 0x0

    goto/16 :goto_13

    .line 283
    .restart local v15    # "expandUp":Z
    :cond_c9
    const/4 v8, 0x0

    goto/16 :goto_2e

    .line 285
    .restart local v8    # "addButtonY":I
    :cond_cc
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    move/from16 v30, v0

    div-int/lit8 v9, v30, 0x2

    goto/16 :goto_42

    .line 292
    .restart local v5    # "addButtonLeft":I
    .restart local v9    # "buttonsHorizontalCenter":I
    .restart local v24    # "labelsOffset":I
    :cond_d6
    add-int v25, v9, v24

    goto :goto_91

    .line 296
    .restart local v25    # "labelsXNearButton":I
    :cond_d9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    .line 298
    invoke-virtual/range {v30 .. v30}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredHeight()I

    move-result v30

    add-int v30, v30, v8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v31, v0

    add-int v27, v30, v31

    goto :goto_9b

    .line 305
    .restart local v10    # "child":Landroid/view/View;
    .restart local v17    # "i":I
    .restart local v27    # "nextY":I
    :cond_ee
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    div-int/lit8 v30, v30, 0x2

    sub-int v11, v9, v30

    .line 306
    .local v11, "childX":I
    if-eqz v15, :cond_274

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v30

    sub-int v12, v27, v30

    .line 307
    .local v12, "childY":I
    :goto_fe
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    add-int v30, v30, v11

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v31

    add-int v31, v31, v12

    move/from16 v0, v30

    move/from16 v1, v31

    invoke-virtual {v10, v11, v12, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 309
    sub-int v30, v8, v12

    move/from16 v0, v30

    int-to-float v13, v0

    .line 310
    .local v13, "collapsedTranslation":F
    const/16 v16, 0x0

    .line 312
    .local v16, "expandedTranslation":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    move/from16 v30, v0

    if-eqz v30, :cond_278

    move/from16 v30, v16

    :goto_122
    move/from16 v0, v30

    invoke-virtual {v10, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 313
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    move/from16 v30, v0

    if-eqz v30, :cond_27c

    const/high16 v30, 0x3f800000

    :goto_131
    move/from16 v0, v30

    invoke-virtual {v10, v0}, Landroid/view/View;->setAlpha(F)V

    .line 315
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v28

    check-cast v28, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;

    .line 316
    .local v28, "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->mCollapseDir:Landroid/animation/ObjectAnimator;
    invoke-static/range {v28 .. v28}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->access$700(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;)Landroid/animation/ObjectAnimator;

    move-result-object v30

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput v16, v31, v32

    const/16 v32, 0x1

    aput v13, v31, v32

    invoke-virtual/range {v30 .. v31}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 317
    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->mExpandDir:Landroid/animation/ObjectAnimator;
    invoke-static/range {v28 .. v28}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->access$800(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;)Landroid/animation/ObjectAnimator;

    move-result-object v30

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput v13, v31, v32

    const/16 v32, 0x1

    aput v16, v31, v32

    invoke-virtual/range {v30 .. v31}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 318
    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->setAnimationsTarget(Landroid/view/View;)V

    .line 320
    sget v30, Lcom/getbase/floatingactionbutton/R$id;->fab_label:I

    move/from16 v0, v30

    invoke-virtual {v10, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/View;

    .line 321
    .local v18, "label":Landroid/view/View;
    if-eqz v18, :cond_268

    .line 322
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsPosition:I

    move/from16 v30, v0

    if-nez v30, :cond_280

    .line 323
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    sub-int v23, v25, v30

    .line 326
    .local v23, "labelXAwayFromButton":I
    :goto_189
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsPosition:I

    move/from16 v30, v0

    if-nez v30, :cond_288

    move/from16 v19, v23

    .line 330
    .local v19, "labelLeft":I
    :goto_193
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsPosition:I

    move/from16 v30, v0

    if-nez v30, :cond_28c

    move/from16 v21, v25

    .line 334
    .local v21, "labelRight":I
    :goto_19d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsVerticalOffset:I

    move/from16 v30, v0

    sub-int v30, v12, v30

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v31

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v32

    sub-int v31, v31, v32

    div-int/lit8 v31, v31, 0x2

    add-int v22, v30, v31

    .line 336
    .local v22, "labelTop":I
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredHeight()I

    move-result v30

    add-int v30, v30, v22

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v22

    move/from16 v3, v21

    move/from16 v4, v30

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 338
    new-instance v29, Landroid/graphics/Rect;

    .line 339
    move/from16 v0, v19

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v30

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v31, v0

    div-int/lit8 v31, v31, 0x2

    sub-int v31, v12, v31

    .line 341
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v32

    add-int v32, v32, v11

    move/from16 v0, v32

    move/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v32

    .line 342
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v33

    add-int v33, v33, v12

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v34, v0

    div-int/lit8 v34, v34, 0x2

    add-int v33, v33, v34

    invoke-direct/range {v29 .. v33}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 343
    .local v29, "touchArea":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    move-object/from16 v30, v0

    new-instance v31, Landroid/view/TouchDelegate;

    move-object/from16 v0, v31

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v10}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    invoke-virtual/range {v30 .. v31}, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->addTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 345
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    move/from16 v30, v0

    if-eqz v30, :cond_290

    move/from16 v30, v16

    :goto_215
    move-object/from16 v0, v18

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 346
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    move/from16 v30, v0

    if-eqz v30, :cond_293

    const/high16 v30, 0x3f800000

    :goto_226
    move-object/from16 v0, v18

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 348
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;

    .line 349
    .local v20, "labelParams":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->mCollapseDir:Landroid/animation/ObjectAnimator;
    invoke-static/range {v20 .. v20}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->access$700(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;)Landroid/animation/ObjectAnimator;

    move-result-object v30

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput v16, v31, v32

    const/16 v32, 0x1

    aput v13, v31, v32

    invoke-virtual/range {v30 .. v31}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 350
    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->mExpandDir:Landroid/animation/ObjectAnimator;
    invoke-static/range {v20 .. v20}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->access$800(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;)Landroid/animation/ObjectAnimator;

    move-result-object v30

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput v13, v31, v32

    const/16 v32, 0x1

    aput v16, v31, v32

    invoke-virtual/range {v30 .. v31}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 351
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->setAnimationsTarget(Landroid/view/View;)V

    .line 354
    .end local v19    # "labelLeft":I
    .end local v20    # "labelParams":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    .end local v21    # "labelRight":I
    .end local v22    # "labelTop":I
    .end local v23    # "labelXAwayFromButton":I
    .end local v29    # "touchArea":Landroid/graphics/Rect;
    :cond_268
    if-eqz v15, :cond_296

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v30, v0

    sub-int v27, v12, v30

    .line 356
    :goto_272
    goto/16 :goto_c3

    .end local v12    # "childY":I
    .end local v13    # "collapsedTranslation":F
    .end local v16    # "expandedTranslation":F
    .end local v18    # "label":Landroid/view/View;
    .end local v28    # "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    :cond_274
    move/from16 v12, v27

    .line 306
    goto/16 :goto_fe

    .restart local v12    # "childY":I
    .restart local v13    # "collapsedTranslation":F
    .restart local v16    # "expandedTranslation":F
    :cond_278
    move/from16 v30, v13

    .line 312
    goto/16 :goto_122

    .line 313
    :cond_27c
    const/16 v30, 0x0

    goto/16 :goto_131

    .line 324
    .restart local v18    # "label":Landroid/view/View;
    .restart local v28    # "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    :cond_280
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    add-int v23, v25, v30

    goto/16 :goto_189

    .restart local v23    # "labelXAwayFromButton":I
    :cond_288
    move/from16 v19, v25

    .line 326
    goto/16 :goto_193

    .restart local v19    # "labelLeft":I
    :cond_28c
    move/from16 v21, v23

    .line 330
    goto/16 :goto_19d

    .restart local v21    # "labelRight":I
    .restart local v22    # "labelTop":I
    .restart local v29    # "touchArea":Landroid/graphics/Rect;
    :cond_290
    move/from16 v30, v13

    .line 345
    goto :goto_215

    .line 346
    :cond_293
    const/16 v30, 0x0

    goto :goto_226

    .line 356
    .end local v19    # "labelLeft":I
    .end local v21    # "labelRight":I
    .end local v22    # "labelTop":I
    .end local v23    # "labelXAwayFromButton":I
    .end local v29    # "touchArea":Landroid/graphics/Rect;
    :cond_296
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v30

    add-int v30, v30, v12

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v31, v0

    add-int v27, v30, v31

    goto :goto_272

    .line 362
    .end local v5    # "addButtonLeft":I
    .end local v8    # "addButtonY":I
    .end local v9    # "buttonsHorizontalCenter":I
    .end local v10    # "child":Landroid/view/View;
    .end local v11    # "childX":I
    .end local v12    # "childY":I
    .end local v13    # "collapsedTranslation":F
    .end local v15    # "expandUp":Z
    .end local v16    # "expandedTranslation":F
    .end local v17    # "i":I
    .end local v18    # "label":Landroid/view/View;
    .end local v24    # "labelsOffset":I
    .end local v25    # "labelsXNearButton":I
    .end local v27    # "nextY":I
    .end local v28    # "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    :pswitch_2a5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    move/from16 v30, v0

    const/16 v31, 0x2

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_340

    const/4 v14, 0x1

    .line 364
    .local v14, "expandLeft":Z
    :goto_2b4
    if-eqz v14, :cond_343

    sub-int v30, p4, p2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredWidth()I

    move-result v31

    sub-int v7, v30, v31

    .line 366
    .local v7, "addButtonX":I
    :goto_2c4
    sub-int v30, p5, p3

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonHeight:I

    move/from16 v31, v0

    sub-int v30, v30, v31

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonHeight:I

    move/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredHeight()I

    move-result v32

    sub-int v31, v31, v32

    div-int/lit8 v31, v31, 0x2

    add-int v6, v30, v31

    .line 367
    .local v6, "addButtonTop":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredWidth()I

    move-result v31

    add-int v31, v31, v7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredHeight()I

    move-result v32

    add-int v32, v32, v6

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v7, v6, v1, v2}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->layout(IIII)V

    .line 369
    if-eqz v14, :cond_345

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v30, v0

    sub-int v26, v7, v30

    .line 373
    .local v26, "nextX":I
    :goto_315
    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonsCount:I

    move/from16 v30, v0

    add-int/lit8 v17, v30, -0x1

    .restart local v17    # "i":I
    :goto_31d
    if-ltz v17, :cond_9

    .line 374
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 376
    .restart local v10    # "child":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    if-eq v10, v0, :cond_33d

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v30

    const/16 v31, 0x8

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_35a

    .line 373
    :cond_33d
    :goto_33d
    add-int/lit8 v17, v17, -0x1

    goto :goto_31d

    .line 362
    .end local v6    # "addButtonTop":I
    .end local v7    # "addButtonX":I
    .end local v10    # "child":Landroid/view/View;
    .end local v14    # "expandLeft":Z
    .end local v17    # "i":I
    .end local v26    # "nextX":I
    :cond_340
    const/4 v14, 0x0

    goto/16 :goto_2b4

    .line 364
    .restart local v14    # "expandLeft":Z
    :cond_343
    const/4 v7, 0x0

    goto :goto_2c4

    .line 369
    .restart local v6    # "addButtonTop":I
    .restart local v7    # "addButtonX":I
    :cond_345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    .line 371
    invoke-virtual/range {v30 .. v30}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredWidth()I

    move-result v30

    add-int v30, v30, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v31, v0

    add-int v26, v30, v31

    goto :goto_315

    .line 378
    .restart local v10    # "child":Landroid/view/View;
    .restart local v17    # "i":I
    .restart local v26    # "nextX":I
    :cond_35a
    if-eqz v14, :cond_3f3

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    sub-int v11, v26, v30

    .line 379
    .restart local v11    # "childX":I
    :goto_362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButton:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getMeasuredHeight()I

    move-result v30

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v31

    sub-int v30, v30, v31

    div-int/lit8 v30, v30, 0x2

    add-int v12, v6, v30

    .line 380
    .restart local v12    # "childY":I
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    add-int v30, v30, v11

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v31

    add-int v31, v31, v12

    move/from16 v0, v30

    move/from16 v1, v31

    invoke-virtual {v10, v11, v12, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 382
    sub-int v30, v7, v11

    move/from16 v0, v30

    int-to-float v13, v0

    .line 383
    .restart local v13    # "collapsedTranslation":F
    const/16 v16, 0x0

    .line 385
    .restart local v16    # "expandedTranslation":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    move/from16 v30, v0

    if-eqz v30, :cond_3f7

    move/from16 v30, v16

    :goto_39a
    move/from16 v0, v30

    invoke-virtual {v10, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 386
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    move/from16 v30, v0

    if-eqz v30, :cond_3fa

    const/high16 v30, 0x3f800000

    :goto_3a9
    move/from16 v0, v30

    invoke-virtual {v10, v0}, Landroid/view/View;->setAlpha(F)V

    .line 388
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v28

    check-cast v28, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;

    .line 389
    .restart local v28    # "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->mCollapseDir:Landroid/animation/ObjectAnimator;
    invoke-static/range {v28 .. v28}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->access$700(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;)Landroid/animation/ObjectAnimator;

    move-result-object v30

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput v16, v31, v32

    const/16 v32, 0x1

    aput v13, v31, v32

    invoke-virtual/range {v30 .. v31}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 390
    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->mExpandDir:Landroid/animation/ObjectAnimator;
    invoke-static/range {v28 .. v28}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->access$800(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;)Landroid/animation/ObjectAnimator;

    move-result-object v30

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput v13, v31, v32

    const/16 v32, 0x1

    aput v16, v31, v32

    invoke-virtual/range {v30 .. v31}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 391
    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;->setAnimationsTarget(Landroid/view/View;)V

    .line 393
    if-eqz v14, :cond_3fd

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v30, v0

    sub-int v26, v11, v30

    .line 395
    :goto_3f1
    goto/16 :goto_33d

    .end local v11    # "childX":I
    .end local v12    # "childY":I
    .end local v13    # "collapsedTranslation":F
    .end local v16    # "expandedTranslation":F
    .end local v28    # "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    :cond_3f3
    move/from16 v11, v26

    .line 378
    goto/16 :goto_362

    .restart local v11    # "childX":I
    .restart local v12    # "childY":I
    .restart local v13    # "collapsedTranslation":F
    .restart local v16    # "expandedTranslation":F
    :cond_3f7
    move/from16 v30, v13

    .line 385
    goto :goto_39a

    .line 386
    :cond_3fa
    const/16 v30, 0x0

    goto :goto_3a9

    .line 395
    .restart local v28    # "params":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams;
    :cond_3fd
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v30

    add-int v30, v30, v11

    move-object/from16 v0, p0

    iget v0, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    move/from16 v31, v0

    add-int v26, v30, v31

    goto :goto_3f1

    .line 274
    :pswitch_data_40c
    .packed-switch 0x0
        :pswitch_a
        :pswitch_a
        :pswitch_2a5
        :pswitch_2a5
    .end packed-switch
.end method

.method protected onMeasure(II)V
    .registers 12
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v6, 0x0

    .line 209
    invoke-virtual {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->measureChildren(II)V

    .line 211
    const/4 v5, 0x0

    .line 212
    .local v5, "width":I
    const/4 v1, 0x0

    .line 214
    .local v1, "height":I
    iput v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    .line 215
    iput v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonHeight:I

    .line 216
    const/4 v4, 0x0

    .line 218
    .local v4, "maxLabelWidth":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonsCount:I

    if-ge v2, v7, :cond_61

    .line 219
    invoke-virtual {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 221
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_1f

    .line 218
    :cond_1c
    :goto_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 225
    :cond_1f
    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    packed-switch v7, :pswitch_data_9a

    .line 238
    :goto_24
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->expandsHorizontally()Z

    move-result v7

    if-nez v7, :cond_1c

    .line 239
    sget v7, Lcom/getbase/floatingactionbutton/R$id;->fab_label:I

    invoke-virtual {v0, v7}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 240
    .local v3, "label":Landroid/widget/TextView;
    if-eqz v3, :cond_1c

    .line 241
    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v7

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_1c

    .line 228
    .end local v3    # "label":Landroid/widget/TextView;
    :pswitch_3d
    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    .line 229
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v1, v7

    .line 230
    goto :goto_24

    .line 233
    :pswitch_4f
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v5, v7

    .line 234
    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonHeight:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonHeight:I

    goto :goto_24

    .line 246
    .end local v0    # "child":Landroid/view/View;
    :cond_61
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->expandsHorizontally()Z

    move-result v7

    if-nez v7, :cond_79

    .line 247
    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonWidth:I

    if-lez v4, :cond_6e

    iget v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mLabelsMargin:I

    add-int/2addr v6, v4

    :cond_6e
    add-int v5, v7, v6

    .line 252
    :goto_70
    iget v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandDirection:I

    packed-switch v6, :pswitch_data_a6

    .line 265
    :goto_75
    invoke-virtual {p0, v5, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->setMeasuredDimension(II)V

    .line 266
    return-void

    .line 249
    :cond_79
    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mMaxButtonHeight:I

    goto :goto_70

    .line 255
    :pswitch_7c
    iget v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    mul-int/2addr v6, v7

    add-int/2addr v1, v6

    .line 256
    invoke-direct {p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->adjustForOvershoot(I)I

    move-result v1

    .line 257
    goto :goto_75

    .line 260
    :pswitch_8b
    iget v6, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mButtonSpacing:I

    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    mul-int/2addr v6, v7

    add-int/2addr v5, v6

    .line 261
    invoke-direct {p0, v5}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->adjustForOvershoot(I)I

    move-result v5

    goto :goto_75

    .line 225
    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_3d
        :pswitch_4f
        :pswitch_4f
    .end packed-switch

    .line 252
    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_7c
        :pswitch_7c
        :pswitch_8b
        :pswitch_8b
    .end packed-switch
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 559
    instance-of v1, p1, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;

    if-eqz v1, :cond_2b

    move-object v0, p1

    .line 560
    check-cast v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;

    .line 561
    .local v0, "savedState":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;
    iget-boolean v1, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;->mExpanded:Z

    iput-boolean v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    .line 562
    iget-object v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mTouchDelegateGroup:Lcom/getbase/floatingactionbutton/TouchDelegateGroup;

    iget-boolean v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    invoke-virtual {v1, v2}, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->setEnabled(Z)V

    .line 564
    iget-object v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mRotatingDrawable:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

    if-eqz v1, :cond_21

    .line 565
    iget-object v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mRotatingDrawable:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

    iget-boolean v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    if-eqz v1, :cond_29

    const/high16 v1, 0x43070000

    :goto_1e
    invoke-virtual {v2, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;->setRotation(F)V

    .line 568
    :cond_21
    invoke-virtual {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 572
    .end local v0    # "savedState":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;
    :goto_28
    return-void

    .line 565
    .restart local v0    # "savedState":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;
    :cond_29
    const/4 v1, 0x0

    goto :goto_1e

    .line 570
    .end local v0    # "savedState":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;
    :cond_2b
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_28
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 550
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 551
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;

    invoke-direct {v0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 552
    .local v0, "savedState":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;
    iget-boolean v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    iput-boolean v2, v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;->mExpanded:Z

    .line 554
    return-object v0
.end method

.method public setOnFloatingActionsMenuUpdateListener(Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mListener:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener;

    .line 112
    return-void
.end method

.method public toggle()V
    .registers 2

    .prologue
    .line 524
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpanded:Z

    if-eqz v0, :cond_8

    .line 525
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->collapse()V

    .line 529
    :goto_7
    return-void

    .line 527
    :cond_8
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->expand()V

    goto :goto_7
.end method
