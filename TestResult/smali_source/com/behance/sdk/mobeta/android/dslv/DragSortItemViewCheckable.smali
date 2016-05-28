.class public Lcom/behance/sdk/mobeta/android/dslv/DragSortItemViewCheckable;
.super Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
.source "DragSortItemViewCheckable.java"

# interfaces
.implements Landroid/widget/Checkable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;-><init>(Landroid/content/Context;)V

    .line 26
    return-void
.end method


# virtual methods
.method public isChecked()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemViewCheckable;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 31
    .local v0, "child":Landroid/view/View;
    instance-of v2, v0, Landroid/widget/Checkable;

    if-eqz v2, :cond_f

    .line 32
    check-cast v0, Landroid/widget/Checkable;

    .end local v0    # "child":Landroid/view/View;
    invoke-interface {v0}, Landroid/widget/Checkable;->isChecked()Z

    move-result v1

    .line 34
    :cond_f
    return v1
.end method

.method public setChecked(Z)V
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 39
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemViewCheckable;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 40
    .local v0, "child":Landroid/view/View;
    instance-of v1, v0, Landroid/widget/Checkable;

    if-eqz v1, :cond_e

    .line 41
    check-cast v0, Landroid/widget/Checkable;

    .end local v0    # "child":Landroid/view/View;
    invoke-interface {v0, p1}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 42
    :cond_e
    return-void
.end method

.method public toggle()V
    .registers 3

    .prologue
    .line 46
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemViewCheckable;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 47
    .local v0, "child":Landroid/view/View;
    instance-of v1, v0, Landroid/widget/Checkable;

    if-eqz v1, :cond_e

    .line 48
    check-cast v0, Landroid/widget/Checkable;

    .end local v0    # "child":Landroid/view/View;
    invoke-interface {v0}, Landroid/widget/Checkable;->toggle()V

    .line 49
    :cond_e
    return-void
.end method
