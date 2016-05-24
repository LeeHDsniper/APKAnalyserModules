.class public Landroid/support/v7/widget/AppCompatCheckedTextView;
.super Landroid/widget/CheckedTextView;
.source "AppCompatCheckedTextView.java"


# static fields
.field private static final TINT_ATTRS:[I


# instance fields
.field private mTintManager:Landroid/support/v7/internal/widget/TintManager;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 35
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x1010108

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/AppCompatCheckedTextView;->TINT_ATTRS:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 46
    const v0, 0x10103c8

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatCheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v3, 0x0

    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    sget-boolean v1, Landroid/support/v7/internal/widget/TintManager;->SHOULD_BE_USED:Z

    if-eqz v1, :cond_22

    .line 53
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatCheckedTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/support/v7/widget/AppCompatCheckedTextView;->TINT_ATTRS:[I

    invoke-static {v1, p2, v2, p3, v3}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 55
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    invoke-virtual {v0, v3}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatCheckedTextView;->setCheckMarkDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 58
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/widget/AppCompatCheckedTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 60
    .end local v0    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    :cond_22
    return-void
.end method


# virtual methods
.method public setCheckMarkDrawable(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 64
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckedTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_e

    .line 65
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckedTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatCheckedTextView;->setCheckMarkDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    :goto_d
    return-void

    .line 67
    :cond_e
    invoke-super {p0, p1}, Landroid/widget/CheckedTextView;->setCheckMarkDrawable(I)V

    goto :goto_d
.end method
