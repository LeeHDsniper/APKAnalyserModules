.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
.super Landroid/widget/ImageView;
.source "AdobeImageHighlightImageButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;
    }
.end annotation


# static fields
.field private static final CHECKED_STATE_SET:[I


# instance fields
.field private mBlendMode:Landroid/graphics/PorterDuff$Mode;

.field private mBroadcasting:Z

.field private mChecked:Z

.field private mColorFilterTintChecked:Landroid/graphics/ColorFilter;

.field private mColorFilterTintPressed:Landroid/graphics/ColorFilter;

.field private mColorFilterTintSelected:Landroid/graphics/ColorFilter;

.field private mGlowSize:I

.field private mGlowStatus:I

.field private mHighlightColorChecked:I

.field private mHighlightColorPressed:I

.field private mHighlightColorSelected:I

.field private mHighlightMode:I

.field private mOnCheckedChangeListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;

.field private mToggleEnabled:Z

.field private mUnToggleUserEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 27
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->CHECKED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    .line 31
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    .line 32
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    .line 57
    sget-object v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton:[I

    invoke-virtual {p1, p2, v1, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v7

    .line 58
    .local v7, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_highlightColorPressed:I

    invoke-virtual {v7, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    .line 59
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_highlightColorChecked:I

    invoke-virtual {v7, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    .line 60
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_highlightColorSelected:I

    invoke-virtual {v7, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    .line 61
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_toggleable:I

    invoke-virtual {v7, v1, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mToggleEnabled:Z

    .line 62
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_untoggleable:I

    invoke-virtual {v7, v1, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mUnToggleUserEnabled:Z

    .line 63
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_blendMode:I

    invoke-virtual {v7, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 65
    .local v11, "mode":Ljava/lang/String;
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_glowMode:I

    invoke-virtual {v7, v1, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    .line 66
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_glowSize:I

    const/4 v2, 0x7

    invoke-virtual {v7, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowSize:I

    .line 67
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_highlightMode:I

    invoke-virtual {v7, v1, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    .line 69
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_adobe_checked:I

    invoke-virtual {v7, v1, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v8

    .line 71
    .local v8, "checked":Z
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mToggleEnabled:Z

    if-nez v1, :cond_64

    .line 72
    const/4 v8, 0x0

    .line 75
    :cond_64
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    invoke-static {v1, v3}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v1

    if-eqz v1, :cond_77

    .line 76
    new-instance v1, Landroid/graphics/LightingColorFilter;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    invoke-direct {v1, v2, v3}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintPressed:Landroid/graphics/ColorFilter;

    .line 79
    :cond_77
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    const/4 v2, 0x4

    invoke-static {v1, v2}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v1

    if-eqz v1, :cond_8b

    .line 80
    new-instance v1, Landroid/graphics/LightingColorFilter;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    invoke-direct {v1, v2, v3}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintChecked:Landroid/graphics/ColorFilter;

    .line 83
    :cond_8b
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v1

    if-eqz v1, :cond_a0

    .line 84
    new-instance v1, Landroid/graphics/LightingColorFilter;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    invoke-direct {v1, v2, v3}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintSelected:Landroid/graphics/ColorFilter;

    .line 87
    :cond_a0
    if-eqz v11, :cond_d5

    .line 88
    invoke-static {v11}, Landroid/graphics/PorterDuff$Mode;->valueOf(Ljava/lang/String;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    .line 93
    :goto_a8
    invoke-virtual {p0, v8, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(ZZ)V

    .line 96
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageHighlightImageButton_android_focusable:I

    invoke-virtual {v7, v1, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v10

    .line 98
    .local v10, "focusable":Z
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    .line 99
    invoke-virtual {p0, v10}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setFocusable(Z)V

    .line 101
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 103
    .local v9, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v1, v9, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    if-eqz v1, :cond_d4

    .line 104
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    .line 105
    .local v0, "glow":Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowSize:I

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->updateConfig(IIIIII)V

    .line 113
    .end local v0    # "glow":Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;
    :cond_d4
    return-void

    .line 90
    .end local v9    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v10    # "focusable":Z
    :cond_d5
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    goto :goto_a8
.end method


# virtual methods
.method public isChecked()Z
    .registers 2

    .prologue
    .line 314
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    return v0
.end method

.method public onCreateDrawableState(I)[I
    .registers 8
    .param p1, "extraSpace"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LongLogTag"
        }
    .end annotation

    .prologue
    .line 225
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 226
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    add-int/lit8 v5, p1, 0x1

    invoke-super {p0, v5}, Landroid/widget/ImageView;->onCreateDrawableState(I)[I

    move-result-object v2

    .line 228
    .local v2, "drawableState":[I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v0

    .line 229
    .local v0, "checked":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isPressed()Z

    move-result v3

    .line 230
    .local v3, "pressed":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isSelected()Z

    move-result v4

    .line 232
    .local v4, "selected":Z
    if-eqz v1, :cond_1f

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    if-eqz v5, :cond_1f

    .line 233
    invoke-virtual {p0, v1, v3, v0, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->updateDrawable(Landroid/graphics/drawable/Drawable;ZZZ)V

    .line 236
    :cond_1f
    if-eqz v0, :cond_26

    .line 237
    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->CHECKED_STATE_SET:[I

    invoke-static {v2, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mergeDrawableStates([I[I)[I

    .line 239
    :cond_26
    return-object v2
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 244
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 245
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 246
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setChecked(Z)V

    .line 247
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 251
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 252
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 253
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mToggleEnabled:Z

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCheckable(Z)V

    .line 254
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setChecked(Z)V

    .line 255
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 331
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;

    .line 332
    .local v0, "ss":Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/ImageView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 333
    iget-boolean v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->checked:Z

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(ZZ)V

    .line 334
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->requestLayout()V

    .line 335
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 323
    invoke-super {p0}, Landroid/widget/ImageView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 324
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 325
    .local v0, "ss":Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$SavedState;->checked:Z

    .line 326
    return-object v0
.end method

.method protected onSetAlpha(I)Z
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 339
    const/4 v0, 0x0

    return v0
.end method

.method public performClick()Z
    .registers 2

    .prologue
    .line 263
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->toggle()V

    .line 264
    invoke-super {p0}, Landroid/widget/ImageView;->performClick()Z

    move-result v0

    return v0
.end method

.method public setChecked(Z)V
    .registers 3
    .param p1, "checked"    # Z

    .prologue
    .line 318
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(ZZ)V

    .line 319
    return-void
.end method

.method protected setChecked(ZZ)V
    .registers 5
    .param p1, "checked"    # Z
    .param p2, "fromUser"    # Z

    .prologue
    .line 116
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mToggleEnabled:Z

    if-nez v0, :cond_5

    .line 135
    :cond_4
    :goto_4
    return-void

    .line 120
    :cond_5
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    if-eq v0, p1, :cond_4

    .line 121
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    .line 122
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->invalidate()V

    .line 123
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->refreshDrawableState()V

    .line 125
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBroadcasting:Z

    if-nez v0, :cond_4

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBroadcasting:Z

    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mOnCheckedChangeListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;

    if-eqz v0, :cond_23

    .line 131
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mOnCheckedChangeListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    invoke-interface {v0, p0, v1, p2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;->onCheckedChanged(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;ZZ)V

    .line 133
    :cond_23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBroadcasting:Z

    goto :goto_4
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 11
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 194
    .local v8, "current":Landroid/graphics/drawable/Drawable;
    instance-of v0, v8, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    if-eqz v0, :cond_12

    move-object v0, v8

    .line 195
    check-cast v0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 196
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 209
    :goto_11
    return-void

    .line 200
    :cond_12
    new-instance v0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowSize:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;-><init>(Landroid/graphics/Bitmap;IIIIII)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 11
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 168
    instance-of v1, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_36

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 171
    .local v8, "current":Landroid/graphics/drawable/Drawable;
    instance-of v1, v8, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    if-eqz v1, :cond_1d

    move-object v1, v8

    .line 172
    check-cast v1, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 173
    move-object p1, v8

    .line 187
    .end local v8    # "current":Landroid/graphics/drawable/Drawable;
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_19
    :goto_19
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 188
    return-void

    .line 175
    .restart local v8    # "current":Landroid/graphics/drawable/Drawable;
    :cond_1d
    new-instance v0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 176
    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorSelected:I

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowSize:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mGlowStatus:I

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;-><init>(Landroid/graphics/Bitmap;IIIIII)V

    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    move-object p1, v0

    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_19

    .line 184
    .end local v8    # "current":Landroid/graphics/drawable/Drawable;
    :cond_36
    instance-of v1, p1, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v1, :cond_19

    goto :goto_19
.end method

.method public setImageResource(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 154
    .local v2, "res":Landroid/content/res/Resources;
    :try_start_4
    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 155
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 156
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->invalidate()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_e} :catch_f

    .line 163
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :goto_e
    return-void

    .line 158
    :catch_f
    move-exception v1

    .line 159
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 162
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_e
.end method

.method public setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mOnCheckedChangeListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;

    .line 259
    return-void
.end method

.method public setPressed(Z)V
    .registers 5
    .param p1, "pressed"    # Z

    .prologue
    .line 269
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setPressed(Z)V

    .line 271
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 273
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_18

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    if-eqz v1, :cond_18

    .line 274
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isSelected()Z

    move-result v2

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->updateDrawable(Landroid/graphics/drawable/Drawable;ZZZ)V

    .line 276
    :cond_18
    return-void
.end method

.method public setSelected(Z)V
    .registers 5
    .param p1, "selected"    # Z

    .prologue
    .line 213
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 215
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 217
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_18

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    if-eqz v1, :cond_18

    .line 218
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isPressed()Z

    move-result v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v2

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->updateDrawable(Landroid/graphics/drawable/Drawable;ZZZ)V

    .line 220
    :cond_18
    return-void
.end method

.method public toggle()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 343
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mUnToggleUserEnabled:Z

    if-nez v0, :cond_a

    .line 347
    :goto_9
    return-void

    .line 346
    :cond_a
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mChecked:Z

    if-nez v0, :cond_13

    move v0, v1

    :goto_f
    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(ZZ)V

    goto :goto_9

    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method protected updateDrawable(Landroid/graphics/drawable/Drawable;ZZZ)V
    .registers 7
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "pressed"    # Z
    .param p3, "checked"    # Z
    .param p4, "selected"    # Z

    .prologue
    .line 280
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 281
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->invalidate()V

    .line 311
    :cond_9
    :goto_9
    return-void

    .line 285
    :cond_a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 287
    if-nez p2, :cond_17

    if-nez p3, :cond_17

    if-eqz p4, :cond_6f

    .line 289
    :cond_17
    if-eqz p2, :cond_34

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 290
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintPressed:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_2c

    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintPressed:Landroid/graphics/ColorFilter;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_9

    .line 293
    :cond_2c
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorPressed:I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_9

    .line 295
    :cond_34
    if-eqz p3, :cond_51

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v0

    if-eqz v0, :cond_51

    .line 296
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintChecked:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_49

    .line 297
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintChecked:Landroid/graphics/ColorFilter;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_9

    .line 299
    :cond_49
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_9

    .line 301
    :cond_51
    if-eqz p4, :cond_9

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightMode:I

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 302
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintSelected:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_67

    .line 303
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mColorFilterTintSelected:Landroid/graphics/ColorFilter;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_9

    .line 305
    :cond_67
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mHighlightColorChecked:I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->mBlendMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_9

    .line 309
    :cond_6f
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    goto :goto_9
.end method
