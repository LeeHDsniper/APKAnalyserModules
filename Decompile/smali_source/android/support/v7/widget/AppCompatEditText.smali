.class public Landroid/support/v7/widget/AppCompatEditText;
.super Landroid/widget/EditText;
.source "AppCompatEditText.java"


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
    .line 41
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100d4

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/AppCompatEditText;->TINT_ATTRS:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 54
    sget v0, Landroid/support/v7/appcompat/R$attr;->editTextStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v4, 0x0

    .line 58
    invoke-static {p1}, Landroid/support/v7/internal/widget/TintContextWrapper;->wrap(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    sget-boolean v2, Landroid/support/v7/internal/widget/TintManager;->SHOULD_BE_USED:Z

    if-eqz v2, :cond_37

    .line 61
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatEditText;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroid/support/v7/widget/AppCompatEditText;->TINT_ATTRS:[I

    invoke-static {v2, p2, v3, p3, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 63
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    invoke-virtual {v0, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 64
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v0, v4, v3}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 65
    .local v1, "tint":Landroid/content/res/ColorStateList;
    if-eqz v1, :cond_2e

    .line 66
    invoke-direct {p0, v1}, Landroid/support/v7/widget/AppCompatEditText;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 69
    .end local v1    # "tint":Landroid/content/res/ColorStateList;
    :cond_2e
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v7/widget/AppCompatEditText;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 70
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 72
    .end local v0    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    :cond_37
    return-void
.end method

.method private applySupportBackgroundTint()V
    .registers 2

    .prologue
    .line 154
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatEditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 155
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_10

    .line 156
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    .line 161
    :cond_f
    :goto_f
    return-void

    .line 157
    :cond_10
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_f

    .line 158
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    goto :goto_f
.end method

.method private setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 164
    if-eqz p1, :cond_1a

    .line 165
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_d

    .line 166
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 168
    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 169
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 173
    :goto_16
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatEditText;->applySupportBackgroundTint()V

    .line 174
    return-void

    .line 171
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mInternalBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    goto :goto_16
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 149
    invoke-super {p0}, Landroid/widget/EditText;->drawableStateChanged()V

    .line 150
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatEditText;->applySupportBackgroundTint()V

    .line 151
    return-void
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

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
    .line 144
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

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
    .line 83
    invoke-super {p0, p1}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 85
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatEditText;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 86
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 78
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_d
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatEditText;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    .line 79
    return-void

    .line 78
    :cond_11
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 97
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 98
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 100
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 101
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 103
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatEditText;->applySupportBackgroundTint()V

    .line 104
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 126
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 127
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 129
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 130
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatEditText;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintMode:Z

    .line 132
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatEditText;->applySupportBackgroundTint()V

    .line 133
    return-void
.end method
