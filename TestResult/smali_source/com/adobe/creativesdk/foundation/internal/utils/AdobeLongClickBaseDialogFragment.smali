.class public abstract Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AdobeLongClickBaseDialogFragment.java"


# instance fields
.field private _currentDialog:Landroid/app/Dialog;

.field private assetName:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private longClickMenuItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private menuContainer:Landroid/view/ViewGroup;

.field private startPriority:I

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "assetName"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->context:Landroid/content/Context;

    .line 44
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->assetName:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method private addCommonMenuItems()V
    .registers 3

    .prologue
    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getSaveToDevice()Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    return-void
.end method

.method private addItemsToMenuView()V
    .registers 12

    .prologue
    const/4 v10, -0x2

    const/4 v9, 0x0

    .line 77
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v0, v7, :cond_9d

    .line 82
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v3, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 83
    .local v3, "item":Landroid/widget/LinearLayout;
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/16 v8, 0x78

    invoke-direct {v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 86
    .local v4, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v7, 0x10

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 87
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 88
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;-><init>(Landroid/content/Context;)V

    .line 91
    .local v6, "textView":Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    const/high16 v7, 0x41a00000

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;->setTextSize(F)V

    .line 94
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->getItemName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    new-instance v2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v2, v7}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 97
    .local v2, "iconView":Landroid/widget/ImageView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_asset_edit_dialog_fragment_image_height:I

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getSizeFromResource(I)I

    move-result v7

    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_asset_edit_dialog_fragment_image_height:I

    .line 98
    invoke-direct {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getSizeFromResource(I)I

    move-result v8

    invoke-direct {v1, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 99
    .local v1, "iconLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_asset_edit_dialog_fragment_margin_left:I

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getSizeFromResource(I)I

    move-result v7

    invoke-virtual {v1, v9, v9, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 100
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->getItemIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 103
    move v5, v0

    .line 104
    .local v5, "pos":I
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;

    invoke-direct {v7, p0, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;I)V

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 114
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->menuContainer:Landroid/view/ViewGroup;

    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_8

    .line 120
    .end local v1    # "iconLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v2    # "iconView":Landroid/widget/ImageView;
    .end local v3    # "item":Landroid/widget/LinearLayout;
    .end local v4    # "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "pos":I
    .end local v6    # "textView":Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;
    :cond_9d
    return-void
.end method

.method private getSaveToDevice()Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;
    .registers 8

    .prologue
    .line 168
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->ic_forum_black_24dp:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 169
    .local v3, "itemResource":Landroid/graphics/drawable/Drawable;
    const-string v1, "Save To Device"

    .line 170
    .local v1, "itemName":Ljava/lang/String;
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->startPriority:I

    .line 171
    .local v2, "itemPriority":I
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$2;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;)V

    .line 177
    .local v4, "longMenuItemClickListener":Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;

    invoke-direct {v0, v1, v3, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;-><init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;)V

    .line 178
    .local v0, "item":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;
    return-object v0
.end method

.method private getSizeFromResource(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method


# virtual methods
.method public addCustomMenuItems(Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 157
    .local p1, "customMenuItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_13

    .line 158
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 159
    :cond_13
    return-void
.end method

.method public endDialogFragment()V
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->_currentDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->_currentDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 73
    :cond_9
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->context:Landroid/content/Context;

    return-object v0
.end method

.method protected abstract handleExportClick()V
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 124
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 125
    const/4 v0, 0x0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$style;->TransparentDialog:I

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->setStyle(II)V

    .line 127
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/high16 v4, 0x10000000

    .line 52
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_asset_long_click_banner_dialogview:I

    invoke-virtual {p1, v2, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 53
    .local v1, "longClickView":Landroid/view/View;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_view_long_click_main_container:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->tag:Ljava/lang/String;

    .line 54
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->long_click_menu_container:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->menuContainer:Landroid/view/ViewGroup;

    .line 55
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_long_click_name:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 56
    .local v0, "assetNameView":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->assetName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->addCommonMenuItems()V

    .line 59
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->addItemsToMenuView()V

    .line 60
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->_currentDialog:Landroid/app/Dialog;

    .line 62
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/Window;->requestFeature(I)Z

    .line 64
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 66
    return-object v1
.end method

.method public onResume()V
    .registers 4

    .prologue
    .line 131
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 132
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 135
    .local v0, "window":Landroid/view/Window;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->tag:Ljava/lang/String;

    const-string v2, "NORMAL"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 136
    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 137
    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 141
    :cond_1f
    return-void
.end method

.method public setStartPriority(I)V
    .registers 2
    .param p1, "startPriority"    # I

    .prologue
    .line 190
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->startPriority:I

    .line 191
    return-void
.end method
