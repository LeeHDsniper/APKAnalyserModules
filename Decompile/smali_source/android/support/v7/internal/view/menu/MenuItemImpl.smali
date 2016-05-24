.class public final Landroid/support/v7/internal/view/menu/MenuItemImpl;
.super Ljava/lang/Object;
.source "MenuItemImpl.java"

# interfaces
.implements Landroid/support/v4/internal/view/SupportMenuItem;


# static fields
.field private static sDeleteShortcutLabel:Ljava/lang/String;

.field private static sEnterShortcutLabel:Ljava/lang/String;

.field private static sPrependShortcutLabel:Ljava/lang/String;

.field private static sSpaceShortcutLabel:Ljava/lang/String;


# instance fields
.field private mActionProvider:Landroid/support/v4/view/ActionProvider;

.field private mActionView:Landroid/view/View;

.field private final mCategoryOrder:I

.field private mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private mFlags:I

.field private final mGroup:I

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mIconResId:I

.field private final mId:I

.field private mIntent:Landroid/content/Intent;

.field private mIsActionViewExpanded:Z

.field private mItemCallback:Ljava/lang/Runnable;

.field private mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field private mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

.field private mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

.field private final mOrdering:I

.field private mShortcutAlphabeticChar:C

.field private mShortcutNumericChar:C

.field private mShowAsAction:I

.field private mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleCondensed:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Landroid/support/v7/internal/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V
    .registers 10
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "group"    # I
    .param p3, "id"    # I
    .param p4, "categoryOrder"    # I
    .param p5, "ordering"    # I
    .param p6, "title"    # Ljava/lang/CharSequence;
    .param p7, "showAsAction"    # I

    .prologue
    const/4 v1, 0x0

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 77
    const/16 v0, 0x10

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 85
    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 90
    iput-boolean v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    .line 134
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 135
    iput p3, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    .line 136
    iput p2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mGroup:I

    .line 137
    iput p4, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mCategoryOrder:I

    .line 138
    iput p5, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOrdering:I

    .line 139
    iput-object p6, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 140
    iput p7, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 141
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Landroid/support/v7/internal/view/menu/MenuBuilder;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 41
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method


# virtual methods
.method public actionFormatChanged()V
    .registers 2

    .prologue
    .line 554
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 555
    return-void
.end method

.method public collapseActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 695
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_8

    .line 708
    :cond_7
    :goto_7
    return v0

    .line 698
    :cond_8
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-nez v1, :cond_e

    .line 700
    const/4 v0, 0x1

    goto :goto_7

    .line 703
    :cond_e
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    invoke-interface {v1, p0}, Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;->onMenuItemActionCollapse(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 705
    :cond_1a
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    goto :goto_7
.end method

.method public expandActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 681
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->hasCollapsibleActionView()Z

    move-result v1

    if-nez v1, :cond_8

    .line 690
    :cond_7
    :goto_7
    return v0

    .line 685
    :cond_8
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    if-eqz v1, :cond_14

    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    invoke-interface {v1, p0}, Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;->onMenuItemActionExpand(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 687
    :cond_14
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->expandItemActionView(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    goto :goto_7
.end method

.method public getActionProvider()Landroid/view/ActionProvider;
    .registers 3

    .prologue
    .line 645
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.getActionProvider()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getActionView()Landroid/view/View;
    .registers 2

    .prologue
    .line 627
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 628
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 633
    :goto_6
    return-object v0

    .line 629
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v0, :cond_16

    .line 630
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 631
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    goto :goto_6

    .line 633
    :cond_16
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getAlphabeticShortcut()C
    .registers 2

    .prologue
    .line 238
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    return v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 198
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mGroup:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 4

    .prologue
    .line 417
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_7

    .line 418
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 428
    :goto_6
    return-object v0

    .line 421
    :cond_7
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    if-eqz v1, :cond_1d

    .line 422
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    invoke-static {v1, v2}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 423
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 424
    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_6

    .line 428
    .end local v0    # "icon":Landroid/graphics/drawable/Drawable;
    :cond_1d
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getItemId()I
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 204
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 550
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    return-object v0
.end method

.method public getNumericShortcut()C
    .registers 2

    .prologue
    .line 256
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    return v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 209
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mCategoryOrder:I

    return v0
.end method

.method public getOrdering()I
    .registers 2

    .prologue
    .line 213
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOrdering:I

    return v0
.end method

.method getShortcut()C
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->isQwertyMode()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    :goto_a
    return v0

    :cond_b
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    goto :goto_a
.end method

.method getShortcutLabel()Ljava/lang/String;
    .registers 4

    .prologue
    .line 296
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getShortcut()C

    move-result v1

    .line 297
    .local v1, "shortcut":C
    if-nez v1, :cond_9

    .line 298
    const-string v2, ""

    .line 321
    :goto_8
    return-object v2

    .line 301
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sPrependShortcutLabel:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 302
    .local v0, "sb":Ljava/lang/StringBuilder;
    sparse-switch v1, :sswitch_data_2e

    .line 317
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 321
    :goto_16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    .line 305
    :sswitch_1b
    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sEnterShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 309
    :sswitch_21
    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sDeleteShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 313
    :sswitch_27
    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sSpaceShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 302
    nop

    :sswitch_data_2e
    .sparse-switch
        0x8 -> :sswitch_21
        0xa -> :sswitch_1b
        0x20 -> :sswitch_27
    .end sparse-switch
.end method

.method public getSubMenu()Landroid/view/SubMenu;
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    return-object v0
.end method

.method public getSupportActionProvider()Landroid/support/v4/view/ActionProvider;
    .registers 2

    .prologue
    .line 651
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 353
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .registers 4

    .prologue
    .line 388
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    if-eqz v1, :cond_17

    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    .line 390
    .local v0, "ctitle":Ljava/lang/CharSequence;
    :goto_6
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-ge v1, v2, :cond_16

    if-eqz v0, :cond_16

    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_16

    .line 394
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 397
    .end local v0    # "ctitle":Ljava/lang/CharSequence;
    :cond_16
    return-object v0

    .line 388
    :cond_17
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    goto :goto_6
.end method

.method getTitleForItemView(Landroid/support/v7/internal/view/menu/MenuView$ItemView;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "itemView"    # Landroid/support/v7/internal/view/menu/MenuView$ItemView;

    .prologue
    .line 363
    if-eqz p1, :cond_d

    invoke-interface {p1}, Landroid/support/v7/internal/view/menu/MenuView$ItemView;->prefersCondensedTitle()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitleCondensed()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_c
.end method

.method public hasCollapsibleActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 719
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_1c

    .line 720
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-nez v1, :cond_17

    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v1, :cond_17

    .line 721
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 723
    :cond_17
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-eqz v1, :cond_1c

    const/4 v0, 0x1

    .line 725
    :cond_1c
    return v0
.end method

.method public hasSubMenu()Z
    .registers 2

    .prologue
    .line 341
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public invoke()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 149
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v2, :cond_e

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v2, p0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 175
    :cond_d
    :goto_d
    return v1

    .line 153
    :cond_e
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v3}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getRootMenu()Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v3

    invoke-virtual {v2, v3, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->dispatchMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 157
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    if-eqz v2, :cond_26

    .line 158
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_d

    .line 162
    :cond_26
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    if-eqz v2, :cond_3e

    .line 164
    :try_start_2a
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_35
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2a .. :try_end_35} :catch_36

    goto :goto_d

    .line 166
    :catch_36
    move-exception v0

    .line 167
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v2, "MenuItemImpl"

    const-string v3, "Can\'t find activity to handle intent; ignoring"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 171
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :cond_3e
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v2, :cond_4a

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v2}, Landroid/support/v4/view/ActionProvider;->onPerformDefaultAction()Z

    move-result v2

    if-nez v2, :cond_d

    .line 175
    :cond_4a
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isActionButton()Z
    .registers 3

    .prologue
    .line 565
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isActionViewExpanded()Z
    .registers 2

    .prologue
    .line 735
    iget-boolean v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    return v0
.end method

.method public isCheckable()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 453
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isChecked()Z
    .registers 3

    .prologue
    .line 477
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 180
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isExclusiveCheckable()Z
    .registers 2

    .prologue
    .line 472
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isVisible()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 503
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v2, :cond_1f

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v2}, Landroid/support/v4/view/ActionProvider;->overridesItemVisibility()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 504
    iget v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_1d

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v2}, Landroid/support/v4/view/ActionProvider;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 506
    :cond_1c
    :goto_1c
    return v0

    :cond_1d
    move v0, v1

    .line 504
    goto :goto_1c

    .line 506
    :cond_1f
    iget v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_1c

    move v0, v1

    goto :goto_1c
.end method

.method public requestsActionButton()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 569
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public requiresActionButton()Z
    .registers 3

    .prologue
    .line 573
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "actionProvider"    # Landroid/view/ActionProvider;

    .prologue
    .line 639
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.setActionProvider()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActionView(I)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 6
    .param p1, "resId"    # I

    .prologue
    .line 619
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 620
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 621
    .local v1, "inflater":Landroid/view/LayoutInflater;
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;

    .line 622
    return-object p0
.end method

.method public setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 608
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 609
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    .line 610
    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    if-lez v0, :cond_17

    .line 611
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    .line 613
    :cond_17
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 614
    return-object p0
.end method

.method public bridge synthetic setActionView(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionView(I)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setActionView(Landroid/view/View;)Landroid/view/MenuItem;
    .registers 3
    .param p1, "x0"    # Landroid/view/View;

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setActionViewExpanded(Z)V
    .registers 4
    .param p1, "isExpanded"    # Z

    .prologue
    .line 729
    iput-boolean p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    .line 730
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 731
    return-void
.end method

.method public setAlphabeticShortcut(C)Landroid/view/MenuItem;
    .registers 4
    .param p1, "alphaChar"    # C

    .prologue
    .line 243
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    if-ne v0, p1, :cond_5

    .line 251
    :goto_4
    return-object p0

    .line 247
    :cond_5
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    .line 249
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    goto :goto_4
.end method

.method public setCheckable(Z)Landroid/view/MenuItem;
    .registers 6
    .param p1, "checkable"    # Z

    .prologue
    const/4 v2, 0x0

    .line 458
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 459
    .local v0, "oldFlags":I
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x2

    if-eqz p1, :cond_17

    const/4 v1, 0x1

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 460
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_16

    .line 461
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 464
    :cond_16
    return-object p0

    :cond_17
    move v1, v2

    .line 459
    goto :goto_a
.end method

.method public setChecked(Z)Landroid/view/MenuItem;
    .registers 3
    .param p1, "checked"    # Z

    .prologue
    .line 482
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_c

    .line 485
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setExclusiveItemChecked(Landroid/view/MenuItem;)V

    .line 490
    :goto_b
    return-object p0

    .line 487
    :cond_c
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setCheckedInt(Z)V

    goto :goto_b
.end method

.method setCheckedInt(Z)V
    .registers 6
    .param p1, "checked"    # Z

    .prologue
    const/4 v2, 0x0

    .line 494
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 495
    .local v0, "oldFlags":I
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x3

    if-eqz p1, :cond_17

    const/4 v1, 0x2

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 496
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_16

    .line 497
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 499
    :cond_16
    return-void

    :cond_17
    move v1, v2

    .line 495
    goto :goto_a
.end method

.method public setEnabled(Z)Landroid/view/MenuItem;
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 185
    if-eqz p1, :cond_f

    .line 186
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 191
    :goto_8
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 193
    return-object p0

    .line 188
    :cond_f
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    goto :goto_8
.end method

.method public setExclusiveCheckable(Z)V
    .registers 4
    .param p1, "exclusive"    # Z

    .prologue
    .line 468
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v1, v0, -0x5

    if-eqz p1, :cond_b

    const/4 v0, 0x4

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 469
    return-void

    .line 468
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIcon(I)Landroid/view/MenuItem;
    .registers 4
    .param p1, "iconResId"    # I

    .prologue
    .line 442
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 443
    iput p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 446
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 448
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v1, 0x0

    .line 433
    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 434
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 435
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 437
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 223
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    .line 224
    return-object p0
.end method

.method public setIsActionButton(Z)V
    .registers 3
    .param p1, "isActionButton"    # Z

    .prologue
    .line 577
    if-eqz p1, :cond_9

    .line 578
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 582
    :goto_8
    return-void

    .line 580
    :cond_9
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    goto :goto_8
.end method

.method setMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 2
    .param p1, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 545
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 546
    return-void
.end method

.method public setNumericShortcut(C)Landroid/view/MenuItem;
    .registers 4
    .param p1, "numericChar"    # C

    .prologue
    .line 261
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    if-ne v0, p1, :cond_5

    .line 269
    :goto_4
    return-object p0

    .line 265
    :cond_5
    iput-char p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    .line 267
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    goto :goto_4
.end method

.method public setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "listener"    # Landroid/view/MenuItem$OnActionExpandListener;

    .prologue
    .line 740
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.setOnActionExpandListener()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "clickListener"    # Landroid/view/MenuItem$OnMenuItemClickListener;

    .prologue
    .line 535
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 536
    return-object p0
.end method

.method public setShortcut(CC)Landroid/view/MenuItem;
    .registers 5
    .param p1, "numericChar"    # C
    .param p2, "alphaChar"    # C

    .prologue
    .line 274
    iput-char p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    .line 275
    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    .line 277
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 279
    return-object p0
.end method

.method public setShowAsAction(I)V
    .registers 4
    .param p1, "actionEnum"    # I

    .prologue
    .line 590
    and-int/lit8 v0, p1, 0x3

    packed-switch v0, :pswitch_data_16

    .line 599
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 602
    :pswitch_d
    iput p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 603
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 604
    return-void

    .line 590
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
        :pswitch_d
        :pswitch_d
    .end packed-switch
.end method

.method public setShowAsActionFlags(I)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "actionEnum"    # I

    .prologue
    .line 675
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setShowAsAction(I)V

    .line 676
    return-object p0
.end method

.method public bridge synthetic setShowAsActionFlags(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setShowAsActionFlags(I)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method setSubMenu(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)V
    .registers 3
    .param p1, "subMenu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 345
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .line 347
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 348
    return-void
.end method

.method public setSupportActionProvider(Landroid/support/v4/view/ActionProvider;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 4
    .param p1, "actionProvider"    # Landroid/support/v4/view/ActionProvider;

    .prologue
    const/4 v1, 0x0

    .line 656
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v0, :cond_a

    .line 657
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ActionProvider;->setVisibilityListener(Landroid/support/v4/view/ActionProvider$VisibilityListener;)V

    .line 659
    :cond_a
    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 660
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    .line 661
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 662
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v0, :cond_22

    .line 663
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    new-instance v1, Landroid/support/v7/internal/view/menu/MenuItemImpl$1;

    invoke-direct {v1, p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl$1;-><init>(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ActionProvider;->setVisibilityListener(Landroid/support/v4/view/ActionProvider$VisibilityListener;)V

    .line 670
    :cond_22
    return-object p0
.end method

.method public setSupportOnActionExpandListener(Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    .prologue
    .line 714
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    .line 715
    return-object p0
.end method

.method public setTitle(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "title"    # I

    .prologue
    .line 383
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 370
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 372
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 374
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_11

    .line 375
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 378
    :cond_11
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 403
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    .line 406
    if-nez p1, :cond_6

    .line 407
    iget-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 410
    :cond_6
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 412
    return-object p0
.end method

.method public setVisible(Z)Landroid/view/MenuItem;
    .registers 3
    .param p1, "shown"    # Z

    .prologue
    .line 528
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setVisibleInt(Z)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemVisibleChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 530
    :cond_b
    return-object p0
.end method

.method setVisibleInt(Z)Z
    .registers 6
    .param p1, "shown"    # Z

    .prologue
    const/4 v2, 0x0

    .line 518
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 519
    .local v0, "oldFlags":I
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x9

    if-eqz p1, :cond_13

    move v1, v2

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 520
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_12

    const/4 v2, 0x1

    :cond_12
    return v2

    .line 519
    :cond_13
    const/16 v1, 0x8

    goto :goto_a
.end method

.method public shouldShowIcon()Z
    .registers 2

    .prologue
    .line 561
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getOptionalIconsVisible()Z

    move-result v0

    return v0
.end method

.method shouldShowShortcut()Z
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->isShortcutsVisible()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getShortcut()C

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public showsTextAsAction()Z
    .registers 3

    .prologue
    .line 585
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 541
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
