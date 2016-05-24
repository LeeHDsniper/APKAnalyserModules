.class public Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;
.super Landroid/widget/MultiAutoCompleteTextView;
.source "AppCompatMultiAutoCompleteTextView.java"


# static fields
.field private static final TINT_ATTRS:[I


# instance fields
.field private mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

.field private mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

.field private mTintManager:Landroid/support/v7/internal/widget/TintManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->TINT_ATTRS:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x10100d4
        0x1010176
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 57
    sget v0, Landroid/support/v7/appcompat/R$attr;->autoCompleteTextViewStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 61
    invoke-static {p1}, Landroid/support/v7/internal/widget/TintContextWrapper;->wrap(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2, p2, p3}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 63
    sget-boolean v2, Landroid/support/v7/internal/widget/TintManager;->SHOULD_BE_USED:Z

    if-eqz v2, :cond_45

    .line 64
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->TINT_ATTRS:[I

    invoke-static {v2, p2, v3, p3, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 66
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 68
    invoke-virtual {v0, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_35

    .line 69
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v0, v4, v3}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 70
    .local v1, "tint":Landroid/content/res/ColorStateList;
    if-eqz v1, :cond_35

    .line 71
    invoke-direct {p0, v1}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 74
    .end local v1    # "tint":Landroid/content/res/ColorStateList;
    :cond_35
    invoke-virtual {v0, v5}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_42

    .line 75
    invoke-virtual {v0, v5}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 77
    :cond_42
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 79
    .end local v0    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    :cond_45
    return-void
.end method

.method private applySupportBackgroundTint()V
    .registers 2

    .prologue
    .line 170
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 171
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_10

    .line 172
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    .line 177
    :cond_f
    :goto_f
    return-void

    .line 173
    :cond_10
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_f

    .line 174
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    goto :goto_f
.end method

.method private setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 180
    if-eqz p1, :cond_1a

    .line 181
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_d

    .line 182
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 184
    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 185
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 189
    :goto_16
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 190
    return-void

    .line 187
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    goto :goto_16
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 165
    invoke-super {p0}, Landroid/widget/MultiAutoCompleteTextView;->drawableStateChanged()V

    .line 166
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 167
    return-void
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

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
    .line 160
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 90
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 93
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 83
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->setBackgroundResource(I)V

    .line 85
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_d
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 86
    return-void

    .line 85
    :cond_11
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setDropDownBackgroundResource(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 97
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_e

    .line 98
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 102
    :goto_d
    return-void

    .line 100
    :cond_e
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->setDropDownBackgroundResource(I)V

    goto :goto_d
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 113
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 114
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 116
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 117
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 119
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 120
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 142
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 143
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 145
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 146
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintMode:Z

    .line 148
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 149
    return-void
.end method
