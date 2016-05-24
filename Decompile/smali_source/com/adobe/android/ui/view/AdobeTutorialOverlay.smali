.class public abstract Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
.super Landroid/widget/RelativeLayout;
.source "AdobeTutorialOverlay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;
    }
.end annotation


# static fields
.field protected static final POSITION_CENTER:Ljava/lang/CharSequence;

.field protected static final POSITION_LEFT:Ljava/lang/CharSequence;

.field protected static final POSITION_RIGHT:Ljava/lang/CharSequence;

.field protected static final POSITION_TOP:Ljava/lang/CharSequence;


# instance fields
.field private alpha:F

.field private hideAnimation:Lcom/nineoldandroids/animation/Animator;

.field private inLayout:Z

.field private final mActivationDelay:I

.field private mActive:Z

.field private final mAnimationDuration:I

.field private final mArrow:I

.field private final mBackgroundAlpha:I

.field private mBackgroundColor:I

.field private mCloseButton:Landroid/widget/Button;

.field private final mCloseButtonResId:I

.field protected mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

.field protected final mClosebuttonMargins:I

.field private final mMetrics:Landroid/util/DisplayMetrics;

.field protected mOrientationChanged:Z

.field private final mOriginalBackgroundColor:I

.field private final mRipple:I

.field protected final mTagName:Ljava/lang/String;

.field private final mTextMargins:I

.field private final mTextStyle:I

.field private final mTitleMargins:I

.field private final mTitleStyle:I

.field private mVisible:Z

.field protected overlayId:I

.field private showAnimation:Lcom/nineoldandroids/animation/Animator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    const-string v0, "left"

    sput-object v0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->POSITION_LEFT:Ljava/lang/CharSequence;

    .line 53
    const-string v0, "center"

    sput-object v0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->POSITION_CENTER:Ljava/lang/CharSequence;

    .line 54
    const-string v0, "right"

    sput-object v0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->POSITION_RIGHT:Ljava/lang/CharSequence;

    .line 55
    const-string v0, "top"

    sput-object v0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->POSITION_TOP:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;II)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "toolName"    # Ljava/lang/String;
    .param p3, "styleId"    # I
    .param p4, "overlayId"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 88
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 75
    const/4 v6, 0x0

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->alpha:F

    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 92
    .local v2, "res":Landroid/content/res/Resources;
    iput p4, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->overlayId:I

    .line 93
    iput-object p2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTagName:Ljava/lang/String;

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    .line 97
    .local v5, "theme":Landroid/content/res/Resources$Theme;
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 98
    .local v1, "outValue":Landroid/util/TypedValue;
    const/4 v3, 0x0

    .line 99
    .local v3, "resId":I
    invoke-virtual {v5, p3, v1, v9}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v4

    .line 100
    .local v4, "resolveAttribute":Z
    if-eqz v4, :cond_22

    .line 101
    iget v3, v1, Landroid/util/TypedValue;->resourceId:I

    .line 104
    :cond_22
    sget-object v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay:[I

    invoke-virtual {v5, v3, v6}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 106
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_android_background:I

    const/high16 v7, -0x1000000

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mOriginalBackgroundColor:I

    .line 107
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_titleStyle:I

    const v7, 0x1030042

    .line 108
    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTitleStyle:I

    .line 109
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_textStyle:I

    const v7, 0x1030044

    .line 110
    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTextStyle:I

    .line 111
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_arrow:I

    sget v7, Lcom/adobe/android/ui/R$drawable;->com_adobe_image_overlay_blemish_arrow:I

    .line 112
    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mArrow:I

    .line 113
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_ripple:I

    sget v7, Lcom/adobe/android/ui/R$drawable;->com_adobe_image_editor_tutorial_ripple:I

    .line 114
    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mRipple:I

    .line 115
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_textMargins:I

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTextMargins:I

    .line 116
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_titleMargins:I

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTitleMargins:I

    .line 117
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_android_animationDuration:I

    const/16 v7, 0xfa

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mAnimationDuration:I

    .line 118
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_closeButtonMargins:I

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mClosebuttonMargins:I

    .line 119
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_activationDelay:I

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mActivationDelay:I

    .line 120
    sget v6, Lcom/adobe/android/ui/R$styleable;->AdobeTutorialOverlay_adobe_closeButtonLayout:I

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButtonResId:I

    .line 122
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 124
    iget v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mOriginalBackgroundColor:I

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mBackgroundColor:I

    .line 125
    iget v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mOriginalBackgroundColor:I

    invoke-static {v6}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    iput v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mBackgroundAlpha:I

    .line 126
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mMetrics:Landroid/util/DisplayMetrics;

    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setTag(Ljava/lang/Object;)V

    .line 135
    const/4 v6, 0x4

    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setVisibility(I)V

    .line 136
    invoke-virtual {p0, v9}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setHardwareAccelerated(Z)V

    .line 138
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xe

    if-lt v6, v7, :cond_be

    .line 139
    invoke-virtual {p0, v9}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setFitsSystemWindows(Z)V

    .line 141
    :cond_be
    return-void
.end method

.method static synthetic access$002(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mVisible:Z

    return p1
.end method

.method static synthetic access$100(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->postActivate()V

    return-void
.end method

.method private createTextLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;I)Landroid/text/DynamicLayout;
    .registers 14
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "width"    # I
    .param p3, "align"    # Landroid/text/Layout$Alignment;
    .param p4, "style"    # I

    .prologue
    const/4 v3, 0x0

    const/high16 v5, 0x3f800000

    const/4 v7, 0x1

    .line 250
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    .line 251
    .local v2, "titlePaint":Landroid/text/TextPaint;
    invoke-virtual {v2, v7}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 252
    invoke-virtual {v2, v7}, Landroid/text/TextPaint;->setLinearText(Z)V

    .line 253
    invoke-virtual {v2, v7}, Landroid/text/TextPaint;->setFilterBitmap(Z)V

    .line 255
    new-instance v8, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v8, v0, p4}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    .line 256
    .local v8, "apperance":Landroid/text/style/TextAppearanceSpan;
    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 257
    .local v1, "string":Landroid/text/SpannableString;
    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v0

    invoke-virtual {v1, v8, v3, v0, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 259
    new-instance v0, Landroid/text/DynamicLayout;

    move v3, p2

    move-object v4, p3

    move v6, v5

    invoke-direct/range {v0 .. v7}, Landroid/text/DynamicLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    return-object v0
.end method

.method public static varargs findOverlay(Landroid/content/Context;[Ljava/lang/Class;)Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Ljava/lang/Class",
            "<+",
            "Lcom/adobe/android/ui/view/AdobeTutorialOverlay;",
            ">;)",
            "Lcom/adobe/android/ui/view/AdobeTutorialOverlay;"
        }
    .end annotation

    .prologue
    .line 386
    .local p1, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<+Lcom/adobe/android/ui/view/AdobeTutorialOverlay;>;"
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "context":Landroid/content/Context;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 387
    .local v1, "decor":Landroid/view/ViewGroup;
    if-eqz v1, :cond_24

    .line 388
    array-length v4, p1

    const/4 v3, 0x0

    :goto_10
    if-ge v3, v4, :cond_24

    aget-object v0, p1, v3

    .line 389
    .local v0, "cls":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    .line 390
    .local v2, "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    if-eqz v2, :cond_21

    .line 395
    .end local v0    # "cls":Ljava/lang/Class;
    .end local v2    # "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    :goto_20
    return-object v2

    .line 388
    .restart local v0    # "cls":Ljava/lang/Class;
    .restart local v2    # "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    :cond_21
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 395
    .end local v0    # "cls":Ljava/lang/Class;
    .end local v2    # "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    :cond_24
    const/4 v2, 0x0

    goto :goto_20
.end method

.method private postActivate()V
    .registers 5

    .prologue
    .line 356
    iget v1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mActivationDelay:I

    if-lez v1, :cond_16

    .line 357
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 358
    .local v0, "handler":Landroid/os/Handler;
    if-eqz v0, :cond_15

    .line 359
    new-instance v1, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$1;

    invoke-direct {v1, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$1;-><init>(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    iget v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mActivationDelay:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 370
    .end local v0    # "handler":Landroid/os/Handler;
    :cond_15
    :goto_15
    return-void

    .line 368
    :cond_16
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->onActivate()V

    goto :goto_15
.end method


# virtual methods
.method protected varargs addCloseButton([I)V
    .registers 8
    .param p1, "rules"    # [I

    .prologue
    const/4 v3, 0x0

    .line 148
    iget-object v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    if-nez v2, :cond_53

    .line 149
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iget v4, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButtonResId:I

    invoke-virtual {v2, v4, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    .line 150
    iget-object v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 152
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    array-length v4, p1

    move v2, v3

    :goto_24
    if-ge v2, v4, :cond_2e

    aget v1, p1, v2

    .line 153
    .local v1, "rule":I
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 155
    .end local v1    # "rule":I
    :cond_2e
    iget v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mClosebuttonMargins:I

    iget v3, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mClosebuttonMargins:I

    .line 156
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/android/ui/utils/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v4

    add-int/2addr v3, v4

    iget v4, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mClosebuttonMargins:I

    iget v5, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mClosebuttonMargins:I

    .line 155
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 159
    iget-object v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    iget-object v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 161
    iget-object v2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->addView(Landroid/view/View;)V

    .line 163
    .end local v0    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_53
    return-void
.end method

.method protected abstract calculatePositions()V
.end method

.method public dismiss()V
    .registers 6

    .prologue
    .line 443
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->inLayout:Z

    .line 444
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_26

    .line 445
    const-string v3, "TutorialOverlay"

    const-string v4, "dismiss"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setOnCloseListener(Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;)V

    .line 450
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 451
    .local v2, "parent":Landroid/view/ViewGroup;
    if-eqz v2, :cond_26

    .line 454
    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 455
    .local v1, "index":I
    const/4 v3, -0x1

    if-le v1, v3, :cond_26

    .line 457
    :try_start_23
    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_26} :catch_27

    .line 464
    .end local v1    # "index":I
    .end local v2    # "parent":Landroid/view/ViewGroup;
    :cond_26
    :goto_26
    return-void

    .line 458
    .restart local v1    # "index":I
    .restart local v2    # "parent":Landroid/view/ViewGroup;
    :catch_27
    move-exception v0

    .line 459
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_26
.end method

.method protected abstract doShow()V
.end method

.method protected fadeIn()V
    .registers 3

    .prologue
    .line 514
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showAnimation:Lcom/nineoldandroids/animation/Animator;

    if-nez v0, :cond_20

    .line 515
    const-string v0, "TutorialOverlay"

    const-string v1, "fadeIn"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateInAnimation()Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showAnimation:Lcom/nineoldandroids/animation/Animator;

    .line 517
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showAnimation:Lcom/nineoldandroids/animation/Animator;

    new-instance v1, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;

    invoke-direct {v1, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;-><init>(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 541
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 543
    :cond_20
    return-void
.end method

.method protected fadeOut(Ljava/lang/String;)V
    .registers 4
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 484
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hideAnimation:Lcom/nineoldandroids/animation/Animator;

    if-nez v0, :cond_20

    .line 485
    const-string v0, "TutorialOverlay"

    const-string v1, "fadeOut"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateHideAnimation()Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hideAnimation:Lcom/nineoldandroids/animation/Animator;

    .line 487
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hideAnimation:Lcom/nineoldandroids/animation/Animator;

    new-instance v1, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;

    invoke-direct {v1, p0, p1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;-><init>(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 509
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hideAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 511
    :cond_20
    return-void
.end method

.method protected generateArrow()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 242
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mArrow:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected generateBitmap(Landroid/text/DynamicLayout;)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "layout"    # Landroid/text/DynamicLayout;

    .prologue
    .line 221
    invoke-virtual {p1}, Landroid/text/DynamicLayout;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/text/DynamicLayout;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 222
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 224
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 225
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p1, v1}, Landroid/text/DynamicLayout;->draw(Landroid/graphics/Canvas;)V

    .line 226
    return-object v0
.end method

.method protected generateHideAnimation()Lcom/nineoldandroids/animation/Animator;
    .registers 5

    .prologue
    .line 478
    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_16

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 479
    .local v0, "animator":Lcom/nineoldandroids/animation/Animator;
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getAnimationDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 480
    return-object v0

    .line 478
    nop

    :array_16
    .array-data 4
        0x3f800000
        0x0
    .end array-data
.end method

.method protected generateInAnimation()Lcom/nineoldandroids/animation/Animator;
    .registers 7

    .prologue
    .line 471
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .local v0, "animator":Lcom/nineoldandroids/animation/Animator;
    move-object v1, v0

    .line 472
    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/nineoldandroids/animation/Animator;

    const/4 v3, 0x0

    const-string v4, "alpha"

    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_26

    invoke-static {p0, v4, v5}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 473
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getAnimationDuration()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 474
    return-object v0

    .line 472
    :array_26
    .array-data 4
        0x0
        0x3f800000
    .end array-data
.end method

.method protected generateRipple()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 246
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mRipple:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected generateTextDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "width"    # I
    .param p4, "align"    # Landroid/text/Layout$Alignment;

    .prologue
    .line 208
    invoke-virtual {p0, p2, p3, p4}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateTextLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/text/DynamicLayout;

    move-result-object v1

    .line 209
    .local v1, "layout":Landroid/text/DynamicLayout;
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateBitmap(Landroid/text/DynamicLayout;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 210
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v2
.end method

.method protected generateTextLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/text/DynamicLayout;
    .registers 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "width"    # I
    .param p3, "align"    # Landroid/text/Layout$Alignment;

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getTextStyle()I

    move-result v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->createTextLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;I)Landroid/text/DynamicLayout;

    move-result-object v0

    return-object v0
.end method

.method protected generateTitleDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "width"    # I
    .param p4, "align"    # Landroid/text/Layout$Alignment;

    .prologue
    .line 202
    invoke-virtual {p0, p2, p3, p4}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateTitleLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/text/DynamicLayout;

    move-result-object v1

    .line 203
    .local v1, "layout":Landroid/text/DynamicLayout;
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->generateBitmap(Landroid/text/DynamicLayout;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 204
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v2
.end method

.method protected generateTitleLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/text/DynamicLayout;
    .registers 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "width"    # I
    .param p3, "align"    # Landroid/text/Layout$Alignment;

    .prologue
    .line 230
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getTitleStyle()I

    move-result v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->createTextLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;I)Landroid/text/DynamicLayout;

    move-result-object v0

    return-object v0
.end method

.method public getAlpha()F
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->alpha:F

    return v0
.end method

.method public getAnimationDuration()I
    .registers 2

    .prologue
    .line 190
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mAnimationDuration:I

    return v0
.end method

.method public getBackgroundColor()I
    .registers 2

    .prologue
    .line 280
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mBackgroundColor:I

    return v0
.end method

.method public getCloseButton()Landroid/widget/Button;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseButton:Landroid/widget/Button;

    return-object v0
.end method

.method protected getDisplayMetrics()Landroid/util/DisplayMetrics;
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mMetrics:Landroid/util/DisplayMetrics;

    return-object v0
.end method

.method protected final getOverlayId()I
    .registers 2

    .prologue
    .line 174
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->overlayId:I

    return v0
.end method

.method public getTextMargins()I
    .registers 2

    .prologue
    .line 198
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTextMargins:I

    return v0
.end method

.method public getTextStyle()I
    .registers 2

    .prologue
    .line 288
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTextStyle:I

    return v0
.end method

.method public getTitleMargins()I
    .registers 2

    .prologue
    .line 194
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTitleMargins:I

    return v0
.end method

.method public getTitleStyle()I
    .registers 2

    .prologue
    .line 284
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTitleStyle:I

    return v0
.end method

.method protected final getToolName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mTagName:Ljava/lang/String;

    return-object v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 431
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hide(Ljava/lang/String;)V

    .line 432
    return-void
.end method

.method public hide(Ljava/lang/String;)V
    .registers 4
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 435
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->isAttachedToParent()Z

    move-result v0

    if-nez v0, :cond_7

    .line 440
    :goto_6
    return-void

    .line 438
    :cond_7
    const-string v0, "TutorialOverlay"

    const-string v1, "hide"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->fadeOut(Ljava/lang/String;)V

    goto :goto_6
.end method

.method protected abstract inAnimationCompleted()V
.end method

.method protected isActive()Z
    .registers 2

    .prologue
    .line 377
    iget-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mActive:Z

    return v0
.end method

.method protected isAttachedToParent()Z
    .registers 2

    .prologue
    .line 467
    iget-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->inLayout:Z

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected isVisible()Z
    .registers 2

    .prologue
    .line 373
    iget-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mVisible:Z

    return v0
.end method

.method protected onActivate()V
    .registers 2

    .prologue
    .line 351
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mActive:Z

    .line 353
    return-void
.end method

.method public onBackPressed()Z
    .registers 3

    .prologue
    .line 576
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->isAttachedToParent()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 577
    const-string v0, "TutorialOverlay"

    const-string v1, "onBackPressed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 578
    const-string v0, "back"

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hide(Ljava/lang/String;)V

    .line 579
    const/4 v0, 0x1

    .line 581
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 586
    const-string v0, "TutorialOverlay"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 588
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-ne p1, v0, :cond_23

    .line 589
    const-string v0, "button"

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->hide(Ljava/lang/String;)V

    .line 591
    :cond_23
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 547
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 548
    const/high16 v0, 0x3f800000

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setAlpha(F)V

    .line 549
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mOrientationChanged:Z

    .line 550
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 7
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 554
    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    .line 555
    iget-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mOrientationChanged:Z

    if-eqz v0, :cond_12

    if-eqz p1, :cond_12

    .line 556
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->calculatePositions()V

    .line 557
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->invalidate()V

    .line 558
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mOrientationChanged:Z

    .line 560
    :cond_12
    return-void
.end method

.method public setAlpha(F)V
    .registers 4
    .param p1, "alpha"    # F

    .prologue
    const/4 v1, 0x0

    .line 179
    iput p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->alpha:F

    .line 180
    iget v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mBackgroundAlpha:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int v0, v0

    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mBackgroundColor:I

    .line 181
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->postInvalidate()V

    .line 182
    return-void
.end method

.method public setHardwareAccelerated(Z)V
    .registers 7
    .param p1, "accelerated"    # Z

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0xb

    const/4 v2, 0x1

    .line 317
    if-eqz p1, :cond_2c

    .line 318
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_28

    .line 319
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->isHardwareAccelerated()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 320
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 321
    .local v0, "hardwarePaint":Landroid/graphics/Paint;
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->OVERLAY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 322
    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setLayerType(ILandroid/graphics/Paint;)V

    .line 336
    .end local v0    # "hardwarePaint":Landroid/graphics/Paint;
    :goto_23
    return-void

    .line 324
    :cond_24
    invoke-virtual {p0, v2, v4}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_23

    .line 327
    :cond_28
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setDrawingCacheEnabled(Z)V

    goto :goto_23

    .line 330
    :cond_2c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_34

    .line 331
    invoke-virtual {p0, v2, v4}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_23

    .line 333
    :cond_34
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setDrawingCacheEnabled(Z)V

    goto :goto_23
.end method

.method public setOnCloseListener(Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    .line 145
    return-void
.end method

.method public abstract shouldShow()Z
.end method

.method public final show()Z
    .registers 3

    .prologue
    .line 381
    const-wide/16 v0, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showDelayed(J)Z

    move-result v0

    return v0
.end method

.method public showDelayed(J)Z
    .registers 10
    .param p1, "delay"    # J

    .prologue
    const/4 v3, 0x1

    const/4 v5, -0x1

    .line 399
    const-string v2, "TutorialOverlay"

    const-string v4, "show"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 402
    .local v0, "decor":Landroid/view/ViewGroup;
    if-eqz v0, :cond_48

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_48

    .line 403
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->shouldShow()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 404
    iput-boolean v3, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->inLayout:Z

    .line 406
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    .line 410
    .local v1, "params":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v0, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHandler()Landroid/os/Handler;

    move-result-object v2

    new-instance v4, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;

    invoke-direct {v4, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;-><init>(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    invoke-virtual {v2, v4, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move v2, v3

    .line 427
    .end local v1    # "params":Landroid/view/WindowManager$LayoutParams;
    :goto_3e
    return v2

    .line 422
    :cond_3f
    const-string v2, "TutorialOverlay"

    const-string v3, "don\'t show"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    :goto_46
    const/4 v2, 0x0

    goto :goto_3e

    .line 425
    :cond_48
    const-string v2, "TutorialOverlay"

    const-string v3, "handler is null"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_46
.end method

.method protected abstract trackTutorialClosed(Ljava/lang/String;)V
.end method

.method protected abstract trackTutorialOpened()V
.end method
