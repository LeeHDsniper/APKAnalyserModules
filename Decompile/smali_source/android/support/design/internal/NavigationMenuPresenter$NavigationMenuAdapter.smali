.class Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;
.super Landroid/widget/BaseAdapter;
.source "NavigationMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/internal/NavigationMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NavigationMenuAdapter"
.end annotation


# instance fields
.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

.field private mUpdateSuspended:Z

.field final synthetic this$0:Landroid/support/design/internal/NavigationMenuPresenter;


# direct methods
.method private appendTransparentIconIfMissing(II)V
    .registers 7
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 403
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_2b

    .line 404
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    invoke-virtual {v2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v1

    .line 405
    .local v1, "item":Landroid/view/MenuItem;
    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_28

    .line 406
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

    if-nez v2, :cond_23

    .line 407
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const v3, 0x106000d

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

    .line 409
    :cond_23
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 403
    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 412
    .end local v1    # "item":Landroid/view/MenuItem;
    :cond_2b
    return-void
.end method

.method private prepareMenuItems()V
    .registers 18

    .prologue
    .line 348
    move-object/from16 v0, p0

    iget-boolean v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    if-eqz v14, :cond_7

    .line 400
    :cond_6
    return-void

    .line 351
    :cond_7
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->clear()V

    .line 352
    const/4 v2, -0x1

    .line 353
    .local v2, "currentGroupId":I
    const/4 v3, 0x0

    .line 354
    .local v3, "currentGroupStart":I
    const/4 v1, 0x0

    .line 355
    .local v1, "currentGroupHasIcon":Z
    const/4 v5, 0x0

    .local v5, "i":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-static {v14}, Landroid/support/design/internal/NavigationMenuPresenter;->access$400(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v14

    invoke-virtual {v14}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v13

    .local v13, "totalSize":I
    :goto_22
    if-ge v5, v13, :cond_6

    .line 356
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-static {v14}, Landroid/support/design/internal/NavigationMenuPresenter;->access$400(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v14

    invoke-virtual {v14}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 357
    .local v6, "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v14

    if-eqz v14, :cond_ae

    .line 358
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v9

    .line 359
    .local v9, "subMenu":Landroid/view/SubMenu;
    invoke-interface {v9}, Landroid/view/SubMenu;->hasVisibleItems()Z

    move-result v14

    if-eqz v14, :cond_aa

    .line 360
    if-eqz v5, :cond_5d

    .line 361
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I
    invoke-static {v15}, Landroid/support/design/internal/NavigationMenuPresenter;->access$500(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v15

    const/16 v16, 0x0

    invoke-static/range {v15 .. v16}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->separator(II)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    :cond_5d
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-static {v6}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->of(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    const/4 v10, 0x0

    .line 365
    .local v10, "subMenuHasIcon":Z
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 366
    .local v12, "subMenuStart":I
    const/4 v7, 0x0

    .local v7, "j":I
    invoke-interface {v9}, Landroid/view/SubMenu;->size()I

    move-result v8

    .local v8, "size":I
    :goto_76
    if-ge v7, v8, :cond_9b

    .line 367
    invoke-interface {v9, v7}, Landroid/view/SubMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v11

    .line 368
    .local v11, "subMenuItem":Landroid/view/MenuItem;
    invoke-interface {v11}, Landroid/view/MenuItem;->isVisible()Z

    move-result v14

    if-eqz v14, :cond_98

    .line 369
    if-nez v10, :cond_8b

    invoke-interface {v11}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_8b

    .line 370
    const/4 v10, 0x1

    .line 372
    :cond_8b
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    check-cast v11, Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .end local v11    # "subMenuItem":Landroid/view/MenuItem;
    invoke-static {v11}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->of(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 366
    :cond_98
    add-int/lit8 v7, v7, 0x1

    goto :goto_76

    .line 375
    :cond_9b
    if-eqz v10, :cond_aa

    .line 376
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v14}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->appendTransparentIconIfMissing(II)V

    .line 355
    .end local v7    # "j":I
    .end local v8    # "size":I
    .end local v9    # "subMenu":Landroid/view/SubMenu;
    .end local v10    # "subMenuHasIcon":Z
    .end local v12    # "subMenuStart":I
    :cond_aa
    :goto_aa
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_22

    .line 380
    :cond_ae
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v4

    .line 381
    .local v4, "groupId":I
    if-eq v4, v2, :cond_101

    .line 382
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 383
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_ff

    const/4 v1, 0x1

    .line 384
    :goto_c3
    if-eqz v5, :cond_e4

    .line 385
    add-int/lit8 v3, v3, 0x1

    .line 386
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I
    invoke-static {v15}, Landroid/support/design/internal/NavigationMenuPresenter;->access$500(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    move-object/from16 v16, v0

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I
    invoke-static/range {v16 .. v16}, Landroid/support/design/internal/NavigationMenuPresenter;->access$500(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v16

    invoke-static/range {v15 .. v16}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->separator(II)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    :cond_e4
    :goto_e4
    if-eqz v1, :cond_f2

    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-nez v14, :cond_f2

    .line 394
    const v14, 0x106000d

    invoke-virtual {v6, v14}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setIcon(I)Landroid/view/MenuItem;

    .line 396
    :cond_f2
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-static {v6}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->of(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    move v2, v4

    goto :goto_aa

    .line 383
    :cond_ff
    const/4 v1, 0x0

    goto :goto_c3

    .line 389
    :cond_101
    if-nez v1, :cond_e4

    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_e4

    .line 390
    const/4 v1, 0x1

    .line 391
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v14}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->appendTransparentIconIfMissing(II)V

    goto :goto_e4
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 329
    const/4 v0, 0x0

    return v0
.end method

.method public createInstanceState()Landroid/os/Bundle;
    .registers 7

    .prologue
    .line 415
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 416
    .local v4, "state":Landroid/os/Bundle;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .local v0, "checkedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v5, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    .line 418
    .local v2, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {v2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v3

    .line 419
    .local v3, "menuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    if-eqz v3, :cond_10

    invoke-virtual {v3}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 420
    invoke-virtual {v3}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 423
    .end local v2    # "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    .end local v3    # "menuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_34
    const-string v5, "android:menu:checked"

    invoke-virtual {v4, v5, v0}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 424
    return-object v4
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 265
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 242
    invoke-virtual {p0, p1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItem(I)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 270
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 280
    invoke-virtual {p0, p1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItem(I)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v0

    .line 281
    .local v0, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->isSeparator()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 282
    const/4 v1, 0x2

    .line 286
    :goto_b
    return v1

    .line 283
    :cond_c
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 284
    const/4 v1, 0x1

    goto :goto_b

    .line 286
    :cond_18
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v6, 0x0

    .line 292
    invoke-virtual {p0, p1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItem(I)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v0

    .line 293
    .local v0, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {p0, p1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItemViewType(I)I

    move-result v3

    .line 294
    .local v3, "viewType":I
    packed-switch v3, :pswitch_data_8a

    .line 324
    :goto_c
    return-object p2

    .line 296
    :pswitch_d
    if-nez p2, :cond_1b

    .line 297
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$000(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Landroid/support/design/R$layout;->design_navigation_item:I

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_1b
    move-object v1, p2

    .line 300
    check-cast v1, Landroid/support/design/internal/NavigationMenuItemView;

    .line 301
    .local v1, "itemView":Landroid/support/design/internal/NavigationMenuItemView;
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mIconTintList:Landroid/content/res/ColorStateList;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$100(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/design/internal/NavigationMenuItemView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 302
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mTextColor:Landroid/content/res/ColorStateList;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$200(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/design/internal/NavigationMenuItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 303
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$300(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_51

    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$300(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    :goto_46
    invoke-virtual {v1, v4}, Landroid/support/design/internal/NavigationMenuItemView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 305
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v4

    invoke-virtual {v1, v4, v6}, Landroid/support/design/internal/NavigationMenuItemView;->initialize(Landroid/support/v7/internal/view/menu/MenuItemImpl;I)V

    goto :goto_c

    .line 303
    :cond_51
    const/4 v4, 0x0

    goto :goto_46

    .line 308
    .end local v1    # "itemView":Landroid/support/design/internal/NavigationMenuItemView;
    :pswitch_53
    if-nez p2, :cond_61

    .line 309
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$000(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Landroid/support/design/R$layout;->design_navigation_item_subheader:I

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_61
    move-object v2, p2

    .line 312
    check-cast v2, Landroid/widget/TextView;

    .line 313
    .local v2, "subHeader":Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c

    .line 316
    .end local v2    # "subHeader":Landroid/widget/TextView;
    :pswitch_70
    if-nez p2, :cond_7e

    .line 317
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$000(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Landroid/support/design/R$layout;->design_navigation_item_separator:I

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 320
    :cond_7e
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getPaddingTop()I

    move-result v4

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getPaddingBottom()I

    move-result v5

    invoke-virtual {p2, v6, v4, v6, v5}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_c

    .line 294
    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_d
        :pswitch_53
        :pswitch_70
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 275
    const/4 v0, 0x3

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 334
    invoke-virtual {p0, p1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItem(I)Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public notifyDataSetChanged()V
    .registers 1

    .prologue
    .line 339
    invoke-direct {p0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->prepareMenuItems()V

    .line 340
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 341
    return-void
.end method

.method public restoreInstanceState(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 428
    const-string v4, "android:menu:checked"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 429
    .local v0, "checkedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_3b

    .line 430
    iput-boolean v5, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    .line 431
    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_11
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_35

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    .line 432
    .local v2, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {v2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v3

    .line 433
    .local v3, "menuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    if-eqz v3, :cond_11

    invoke-virtual {v3}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 434
    invoke-virtual {v3, v5}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_11

    .line 437
    .end local v2    # "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    .end local v3    # "menuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_35
    const/4 v4, 0x0

    iput-boolean v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    .line 438
    invoke-direct {p0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->prepareMenuItems()V

    .line 440
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_3b
    return-void
.end method
