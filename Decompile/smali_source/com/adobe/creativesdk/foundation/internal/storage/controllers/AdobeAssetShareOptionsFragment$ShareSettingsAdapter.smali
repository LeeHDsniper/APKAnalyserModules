.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;
.super Landroid/widget/ArrayAdapter;
.source "AdobeAssetShareOptionsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ShareSettingsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;",
        ">;"
    }
.end annotation


# instance fields
.field mCellHeight:I

.field mInflater:Landroid/view/LayoutInflater;

.field mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;",
            ">;"
        }
    .end annotation
.end field

.field mResId:I

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;Landroid/content/Context;ILjava/util/List;)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "textViewResourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 253
    .local p4, "objects":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    .line 254
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 251
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->mCellHeight:I

    .line 255
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->mList:Ljava/util/List;

    .line 256
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 257
    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->mResId:I

    .line 258
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 266
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;

    .line 267
    .local v0, "item":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;
    move-object v2, p2

    .line 270
    .local v2, "v":Landroid/view/View;
    if-nez v2, :cond_61

    .line 271
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->mResId:I

    const/4 v6, 0x0

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 272
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    invoke-direct {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;)V

    .line 273
    .local v3, "vh":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;
    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$id;->title:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;->title:Landroid/widget/TextView;

    .line 274
    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$id;->icon:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 275
    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 277
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 431
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->mPanelHeightIsInitialized:Z
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;)Z

    move-result v4

    if-nez v4, :cond_48

    .line 432
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;)V

    .line 444
    .local v1, "layoutChangeListener":Landroid/view/View$OnLayoutChangeListener;
    invoke-virtual {v2, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 450
    .end local v1    # "layoutChangeListener":Landroid/view/View$OnLayoutChangeListener;
    :cond_48
    :goto_48
    iget-object v4, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->packageName:Ljava/lang/String;

    iput-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;->packageName:Ljava/lang/CharSequence;

    .line 451
    iget-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v5, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->appName:Ljava/lang/CharSequence;

    sget-object v6, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 452
    iget-object v4, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_60

    .line 453
    iget-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v5, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 455
    :cond_60
    return-object v2

    .line 448
    .end local v3    # "vh":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;
    :cond_61
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;

    .restart local v3    # "vh":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ViewHolder;
    goto :goto_48
.end method
