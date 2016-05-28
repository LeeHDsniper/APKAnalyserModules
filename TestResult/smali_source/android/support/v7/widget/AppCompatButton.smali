.class public Landroid/support/v7/widget/AppCompatButton;
.super Landroid/widget/Button;
.source "AppCompatButton.java"


# static fields
.field private static final TINT_ATTRS:[I


# instance fields
.field private mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

.field private mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

.field private mTintManager:Landroid/support/v7/internal/widget/TintManager;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 46
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100d4

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/AppCompatButton;->TINT_ATTRS:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    sget v0, Landroid/support/v7/appcompat/R$attr;->buttonStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const v10, 0x1010038

    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 65
    sget-boolean v6, Landroid/support/v7/internal/widget/TintManager;->SHOULD_BE_USED:Z

    if-eqz v6, :cond_36

    .line 66
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatButton;->getContext()Landroid/content/Context;

    move-result-object v6

    sget-object v7, Landroid/support/v7/widget/AppCompatButton;->TINT_ATTRS:[I

    invoke-static {v6, p2, v7, p3, v8}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 68
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    invoke-virtual {v0, v8}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 69
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v6

    invoke-virtual {v0, v8, v9}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 70
    .local v5, "tint":Landroid/content/res/ColorStateList;
    if-eqz v5, :cond_2d

    .line 71
    invoke-direct {p0, v5}, Landroid/support/v7/widget/AppCompatButton;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 74
    .end local v5    # "tint":Landroid/content/res/ColorStateList;
    :cond_2d
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v6

    iput-object v6, p0, Landroid/support/v7/widget/AppCompatButton;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 75
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 79
    .end local v0    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    :cond_36
    sget-object v6, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView:[I

    invoke-virtual {p1, p2, v6, p3, v8}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 81
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v6, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView_android_textAppearance:I

    invoke-virtual {v0, v6, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 82
    .local v1, "ap":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 85
    if-eq v1, v9, :cond_61

    .line 86
    sget-object v6, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    invoke-virtual {p1, v1, v6}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 87
    .local v2, "appearance":Landroid/content/res/TypedArray;
    sget v6, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v2, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 88
    sget v6, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v2, v6, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/widget/AppCompatButton;->setAllCaps(Z)V

    .line 90
    :cond_5e
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 94
    .end local v2    # "appearance":Landroid/content/res/TypedArray;
    :cond_61
    sget-object v6, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView:[I

    invoke-virtual {p1, p2, v6, p3, v8}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 95
    sget v6, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView_textAllCaps:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_78

    .line 96
    sget v6, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView_textAllCaps:I

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/widget/AppCompatButton;->setAllCaps(Z)V

    .line 98
    :cond_78
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 100
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatButton;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v4

    .line 101
    .local v4, "textColors":Landroid/content/res/ColorStateList;
    if-eqz v4, :cond_9c

    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v6

    if-nez v6, :cond_9c

    .line 106
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x15

    if-ge v6, v7, :cond_9d

    .line 109
    invoke-static {p1, v10}, Landroid/support/v7/internal/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    .line 119
    .local v3, "disabledTextColor":I
    :goto_91
    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v6

    invoke-static {v6, v3}, Landroid/support/v7/internal/widget/ThemeUtils;->createDisabledStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/support/v7/widget/AppCompatButton;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 122
    .end local v3    # "disabledTextColor":I
    :cond_9c
    return-void

    .line 115
    :cond_9d
    invoke-static {p1, v10}, Landroid/support/v7/internal/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    .restart local v3    # "disabledTextColor":I
    goto :goto_91
.end method

.method private applySupportBackgroundTint()V
    .registers 2

    .prologue
    .line 204
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 205
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_10

    .line 206
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    .line 211
    :cond_f
    :goto_f
    return-void

    .line 207
    :cond_10
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_f

    .line 208
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    goto :goto_f
.end method

.method private setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 214
    if-eqz p1, :cond_1a

    .line 215
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_d

    .line 216
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 218
    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 219
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 223
    :goto_16
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatButton;->applySupportBackgroundTint()V

    .line 224
    return-void

    .line 221
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    goto :goto_16
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 199
    invoke-super {p0}, Landroid/widget/Button;->drawableStateChanged()V

    .line 200
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatButton;->applySupportBackgroundTint()V

    .line 201
    return-void
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 228
    invoke-super {p0, p1}, Landroid/widget/Button;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 229
    const-class v0, Landroid/widget/Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 230
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 234
    invoke-super {p0, p1}, Landroid/widget/Button;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 235
    const-class v0, Landroid/widget/Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 236
    return-void
.end method

.method public setAllCaps(Z)V
    .registers 4
    .param p1, "allCaps"    # Z

    .prologue
    .line 239
    if-eqz p1, :cond_f

    new-instance v0, Landroid/support/v7/internal/text/AllCapsTransformationMethod;

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/internal/text/AllCapsTransformationMethod;-><init>(Landroid/content/Context;)V

    :goto_b
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatButton;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 240
    return-void

    .line 239
    :cond_f
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 133
    invoke-super {p0, p1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 135
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatButton;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 136
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 126
    invoke-super {p0, p1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 128
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_d
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatButton;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 129
    return-void

    .line 128
    :cond_11
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 147
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 148
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 150
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 151
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 153
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatButton;->applySupportBackgroundTint()V

    .line 154
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 176
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 177
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 179
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 180
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatButton;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintMode:Z

    .line 182
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatButton;->applySupportBackgroundTint()V

    .line 183
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 244
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 246
    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 247
    .local v0, "appearance":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 248
    sget v1, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatButton;->setAllCaps(Z)V

    .line 250
    :cond_1b
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 251
    return-void
.end method
