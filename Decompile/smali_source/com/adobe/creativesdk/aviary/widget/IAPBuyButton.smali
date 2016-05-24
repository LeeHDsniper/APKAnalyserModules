.class public Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
.super Landroid/widget/RelativeLayout;
.source "IAPBuyButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;
    }
.end annotation


# instance fields
.field checkDownloadStatus:Ljava/lang/Runnable;

.field mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

.field private mOriginalTextColor:Landroid/content/res/ColorStateList;

.field mPackId:J

.field mProgress:Landroid/view/View;

.field mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

.field mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

.field mTextDrawablesOther:[Landroid/graphics/drawable/Drawable;

.field mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    new-instance v8, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;

    invoke-direct {v8, p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->checkDownloadStatus:Ljava/lang/Runnable;

    .line 60
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v7

    .line 62
    .local v7, "theme":Landroid/content/res/Resources$Theme;
    sget-object v8, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageBuyButton:[I

    const/4 v9, 0x0

    .line 63
    invoke-virtual {v7, p2, v8, p3, v9}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 65
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v8, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageBuyButton_adobe_buttonStyle:I

    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 66
    .local v1, "buttonStyle":I
    sget v8, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageBuyButton_adobe_progressStyle:I

    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    .line 68
    .local v5, "progressStyle":I
    new-instance v6, Lcom/adobe/android/ui/view/AdobeTextView;

    new-instance v8, Landroid/view/ContextThemeWrapper;

    invoke-direct {v8, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v6, v8, p2, p3, v1}, Lcom/adobe/android/ui/view/AdobeTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 71
    .local v6, "textView":Lcom/adobe/android/ui/view/AdobeTextView;
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Lcom/adobe/android/ui/view/AdobeTextView;->setDuplicateParentStateEnabled(Z)V

    .line 72
    const v8, 0x1020014

    invoke-virtual {v6, v8}, Lcom/adobe/android/ui/view/AdobeTextView;->setId(I)V

    .line 74
    invoke-virtual {v6}, Lcom/adobe/android/ui/view/AdobeTextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    .line 75
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    .line 77
    const/4 v8, 0x4

    new-array v8, v8, [Landroid/graphics/drawable/Drawable;

    const/4 v9, 0x0

    const/4 v10, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    const/4 v11, 0x1

    aget-object v10, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x2

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    const/4 v11, 0x2

    aget-object v10, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x3

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    const/4 v11, 0x3

    aget-object v10, v10, v11

    aput-object v10, v8, v9

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesOther:[Landroid/graphics/drawable/Drawable;

    .line 84
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    invoke-direct {v2, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 85
    .local v2, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v8, 0xf

    const/4 v9, -0x1

    invoke-virtual {v2, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 86
    invoke-virtual {p0, v6, v2}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    new-instance v4, Landroid/widget/ProgressBar;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v4, p1, v8, v9, v5}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 89
    .local v4, "progressBar":Landroid/widget/ProgressBar;
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 90
    sget v8, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {v4, v8}, Landroid/widget/ProgressBar;->setId(I)V

    .line 91
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v9, -0x2

    invoke-direct {v3, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 92
    .local v3, "params1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v8, 0xd

    const/4 v9, -0x1

    invoke-virtual {v3, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 93
    invoke-virtual {p0, v4, v3}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 96
    return-void
.end method

.method private restoreFreeWithLoginDrawableTint()V
    .registers 4

    .prologue
    .line 107
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    aget-object v0, v1, v2

    .line 108
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_e

    .line 109
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 110
    invoke-static {v0}, Lcom/adobe/android/ui/utils/UIUtils;->clearDrawableTint(Landroid/graphics/drawable/Drawable;)Z

    .line 112
    :cond_e
    return-void
.end method


# virtual methods
.method public getPackId()J
    .registers 3

    .prologue
    .line 150
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mPackId:J

    return-wide v0
.end method

.method public getPackOption()Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    return-object v0
.end method

.method public getTextView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 145
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 146
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->checkDownloadStatus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 147
    return-void
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 116
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 117
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    .line 118
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mProgress:Landroid/view/View;

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    .line 120
    return-void
.end method

.method public restoreTintColor()V
    .registers 4

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, -0x1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 124
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 125
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->restoreFreeWithLoginDrawableTint()V

    .line 126
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->postInvalidate()V

    .line 127
    return-void
.end method

.method public setFreeWithLoginDrawableTint(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 99
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    aget-object v0, v1, v2

    .line 100
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_e

    .line 101
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 102
    invoke-static {v0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setDrawableTint(Landroid/graphics/drawable/Drawable;I)Z

    .line 104
    :cond_e
    return-void
.end method

.method public setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V
    .registers 16
    .param p1, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .param p2, "packId"    # J

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 154
    if-eqz p1, :cond_f

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 206
    :cond_e
    :goto_e
    return-void

    .line 159
    :cond_f
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 160
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mPackId:J

    .line 162
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 163
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->checkDownloadStatus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 166
    :cond_22
    if-eqz p1, :cond_e

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->isEnabled()Z

    move-result v7

    .line 171
    .local v7, "oldEnableStatus":Z
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mProgress:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v8

    .line 172
    .local v8, "oldProgressVisibility":I
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v9

    .line 174
    .local v9, "oldTextVisibility":I
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;

    const/4 v4, 0x4

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;-><init>(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;ZII)V

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->invoke()Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;

    move-result-object v6

    .line 176
    .local v6, "innerVisibility":Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;
    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->isNewEnableStatus()Z

    move-result v0

    if-eq v7, v0, :cond_4d

    .line 177
    # getter for: Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->access$000(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setEnabled(Z)V

    .line 180
    :cond_4d
    # getter for: Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newProgressVisibility:I
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->access$100(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)I

    move-result v0

    if-eq v8, v0, :cond_5c

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mProgress:Landroid/view/View;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newProgressVisibility:I
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->access$100(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 184
    :cond_5c
    # getter for: Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newTextVisibility:I
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->access$200(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)I

    move-result v0

    if-eq v9, v0, :cond_6b

    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newTextVisibility:I
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->access$200(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 188
    :cond_6b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    if-eqz v0, :cond_e

    .line 189
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v0, v1, :cond_9a

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_9a

    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesFreeWithLogin:[Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    .line 191
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v1, v1, v5

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v2, v2, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v3, v3, v10

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v4, v4, v11

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_e

    .line 196
    :cond_9a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesOther:[Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_e

    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesOther:[Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    .line 198
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v1, v1, v5

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v2, v2, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v3, v3, v10

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextDrawablesCurrent:[Landroid/graphics/drawable/Drawable;

    aget-object v4, v4, v11

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_e
.end method

.method public setTintColor(II)V
    .registers 5
    .param p1, "backgroundColor"    # I
    .param p2, "titleColor"    # I

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 131
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 132
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setFreeWithLoginDrawableTint(I)V

    .line 133
    return-void
.end method
