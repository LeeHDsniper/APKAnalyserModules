.class public Landroid/support/design/internal/NavigationMenuPresenter;
.super Ljava/lang/Object;
.source "NavigationMenuPresenter.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuPresenter;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;,
        Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

.field private mCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

.field private mIconTintList:Landroid/content/res/ColorStateList;

.field private mId:I

.field private mItemBackground:Landroid/graphics/drawable/Drawable;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field private mMenuView:Landroid/support/design/internal/NavigationMenuView;

.field private mPaddingSeparator:I

.field private mPaddingTopDefault:I

.field private mTextColor:Landroid/content/res/ColorStateList;


# direct methods
.method static synthetic access$000(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/internal/NavigationMenuPresenter;

    .prologue
    .line 51
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/internal/NavigationMenuPresenter;

    .prologue
    .line 51
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mIconTintList:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/internal/NavigationMenuPresenter;

    .prologue
    .line 51
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mTextColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/internal/NavigationMenuPresenter;

    .prologue
    .line 51
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/support/v7/internal/view/menu/MenuBuilder;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/internal/NavigationMenuPresenter;

    .prologue
    .line 51
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method static synthetic access$500(Landroid/support/design/internal/NavigationMenuPresenter;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/design/internal/NavigationMenuPresenter;

    .prologue
    .line 51
    iget v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I

    return v0
.end method


# virtual methods
.method public collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 144
    const/4 v0, 0x0

    return v0
.end method

.method public expandItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 139
    const/4 v0, 0x0

    return v0
.end method

.method public flagActionItems()Z
    .registers 2

    .prologue
    .line 134
    const/4 v0, 0x0

    return v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 149
    iget v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mId:I

    return v0
.end method

.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 229
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 221
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mTextColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getItemTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mIconTintList:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public initForMenu(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 83
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 84
    iput-object p2, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 86
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Landroid/support/design/R$dimen;->navigation_padding_top_default:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    iput v1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingTopDefault:I

    .line 87
    sget v1, Landroid/support/design/R$dimen;->navigation_separator_vertical_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    iput v1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I

    .line 89
    return-void
.end method

.method public onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "allMenusAreClosing"    # Z

    .prologue
    .line 127
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_9

    .line 128
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1, p2}, Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;->onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V

    .line 130
    :cond_9
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 10
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenuView:Landroid/support/design/internal/NavigationMenuView;

    invoke-virtual {v1}, Landroid/support/design/internal/NavigationMenuView;->getHeaderViewsCount()I

    move-result v1

    sub-int v0, p3, v1

    .line 186
    .local v0, "positionInAdapter":I
    if-ltz v0, :cond_1a

    .line 187
    iget-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

    invoke-virtual {v2, v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItem(I)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p0, v3}, Landroid/support/v7/internal/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;Landroid/support/v7/internal/view/menu/MenuPresenter;I)Z

    .line 189
    :cond_1a
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "parcelable"    # Landroid/os/Parcelable;

    .prologue
    .line 172
    move-object v2, p1

    check-cast v2, Landroid/os/Bundle;

    .line 173
    .local v2, "state":Landroid/os/Bundle;
    const-string v3, "android:menu:list"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v1

    .line 174
    .local v1, "hierarchy":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    if-eqz v1, :cond_10

    .line 175
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenuView:Landroid/support/design/internal/NavigationMenuView;

    invoke-virtual {v3, v1}, Landroid/support/design/internal/NavigationMenuView;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 177
    :cond_10
    const-string v3, "android:menu:adapter"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 178
    .local v0, "adapterState":Landroid/os/Bundle;
    if-eqz v0, :cond_1d

    .line 179
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

    invoke-virtual {v3, v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->restoreInstanceState(Landroid/os/Bundle;)V

    .line 181
    :cond_1d
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 158
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 159
    .local v1, "state":Landroid/os/Bundle;
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenuView:Landroid/support/design/internal/NavigationMenuView;

    if-eqz v2, :cond_18

    .line 160
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 161
    .local v0, "hierarchy":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mMenuView:Landroid/support/design/internal/NavigationMenuView;

    invoke-virtual {v2, v0}, Landroid/support/design/internal/NavigationMenuView;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 162
    const-string v2, "android:menu:list"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 164
    .end local v0    # "hierarchy":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    :cond_18
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

    if-eqz v2, :cond_27

    .line 165
    const-string v2, "android:menu:adapter"

    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

    invoke-virtual {v3}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->createInstanceState()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 167
    :cond_27
    return-object v1
.end method

.method public onSubMenuSelected(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)Z
    .registers 3
    .param p1, "subMenu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "itemBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 233
    iput-object p1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;

    .line 234
    return-void
.end method

.method public setItemIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 216
    iput-object p1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mIconTintList:Landroid/content/res/ColorStateList;

    .line 217
    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1, "textColor"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 225
    iput-object p1, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mTextColor:Landroid/content/res/ColorStateList;

    .line 226
    return-void
.end method

.method public updateMenuView(Z)V
    .registers 3
    .param p1, "cleared"    # Z

    .prologue
    .line 110
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

    if-eqz v0, :cond_9

    .line 111
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter;->mAdapter:Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->notifyDataSetChanged()V

    .line 113
    :cond_9
    return-void
.end method
