.class public Landroid/support/v7/internal/widget/TintTypedArray;
.super Ljava/lang/Object;
.source "TintTypedArray.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mTintManager:Landroid/support/v7/internal/widget/TintManager;

.field private final mWrapped:Landroid/content/res/TypedArray;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "array"    # Landroid/content/res/TypedArray;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mContext:Landroid/content/Context;

    .line 55
    iput-object p2, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    .line 56
    return-void
.end method

.method public static obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/support/v7/internal/widget/TintTypedArray;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "set"    # Landroid/util/AttributeSet;
    .param p2, "attrs"    # [I

    .prologue
    .line 43
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 44
    .local v0, "array":Landroid/content/res/TypedArray;
    new-instance v1, Landroid/support/v7/internal/widget/TintTypedArray;

    invoke-direct {v1, p0, v0}, Landroid/support/v7/internal/widget/TintTypedArray;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    return-object v1
.end method

.method public static obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "set"    # Landroid/util/AttributeSet;
    .param p2, "attrs"    # [I
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 49
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 50
    .local v0, "array":Landroid/content/res/TypedArray;
    new-instance v1, Landroid/support/v7/internal/widget/TintTypedArray;

    invoke-direct {v1, p0, v0}, Landroid/support/v7/internal/widget/TintTypedArray;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    return-object v1
.end method


# virtual methods
.method public getBoolean(IZ)Z
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # Z

    .prologue
    .line 107
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    return v0
.end method

.method public getDimensionPixelOffset(II)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 135
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    return v0
.end method

.method public getDimensionPixelSize(II)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 139
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    return v0
.end method

.method public getDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 59
    iget-object v1, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v1, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 60
    iget-object v1, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    .line 61
    .local v0, "resourceId":I
    if-eqz v0, :cond_1a

    .line 62
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 65
    .end local v0    # "resourceId":I
    :goto_19
    return-object v1

    :cond_1a
    iget-object v1, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v1, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_19
.end method

.method public getDrawableIfKnown(I)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 69
    iget-object v1, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v1, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 70
    iget-object v1, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    .line 71
    .local v0, "resourceId":I
    if-eqz v0, :cond_1b

    .line 72
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(IZ)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 75
    .end local v0    # "resourceId":I
    :goto_1a
    return-object v1

    :cond_1b
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public getFloat(IF)F
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # F

    .prologue
    .line 115
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    return v0
.end method

.method public getInt(II)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 111
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    return v0
.end method

.method public getInteger(II)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 127
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    return v0
.end method

.method public getLayoutDimension(II)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 147
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v0

    return v0
.end method

.method public getResourceId(II)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 155
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    return v0
.end method

.method public getString(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 99
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(I)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 95
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTintManager()Landroid/support/v7/internal/widget/TintManager;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-nez v0, :cond_c

    .line 192
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/support/v7/internal/widget/TintManager;->get(Landroid/content/Context;)Landroid/support/v7/internal/widget/TintManager;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 194
    :cond_c
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    return-object v0
.end method

.method public hasValue(I)Z
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 171
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    return v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v0

    return v0
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Landroid/support/v7/internal/widget/TintTypedArray;->mWrapped:Landroid/content/res/TypedArray;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 184
    return-void
.end method
