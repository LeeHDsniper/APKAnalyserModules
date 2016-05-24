.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;
.super Landroid/widget/BaseAdapter;
.source "AdobeUxActionBarDropDownController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DataSourceSectionSpinnerAdapter"
.end annotation


# instance fields
.field private mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)V
    .registers 3

    .prologue
    .line 175
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 179
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$1;

    .prologue
    .line 175
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)V

    return-void
.end method

.method private getTitle(I)Ljava/lang/String;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 215
    if-ltz p1, :cond_17

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_17

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->title:Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;)Ljava/lang/String;

    move-result-object v0

    :goto_16
    return-object v0

    :cond_17
    const-string v0, ""

    goto :goto_16
.end method


# virtual methods
.method public addItem(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;Ljava/lang/String;)V
    .registers 6
    .param p1, "ccSection"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    invoke-direct {v1, v2, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 240
    return-void
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 221
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->mContext:Landroid/support/v7/app/ActionBarActivity;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)Landroid/support/v7/app/ActionBarActivity;

    move-result-object v2

    if-nez v2, :cond_12

    .line 222
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 235
    :goto_11
    return-object v0

    .line 225
    :cond_12
    if-eqz p2, :cond_24

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "DROPDOWN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3a

    .line 226
    :cond_24
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->mContext:Landroid/support/v7/app/ActionBarActivity;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)Landroid/support/v7/app/ActionBarActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_spinner_item_dropdown:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 229
    const-string v2, "DROPDOWN"

    invoke-virtual {p2, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 232
    :cond_3a
    const v2, 0x1020014

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 233
    .local v1, "normalTextView":Landroid/widget/TextView;
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->getTitle(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v0, p2

    .line 235
    goto :goto_11
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 193
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 10
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    .line 198
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->mContext:Landroid/support/v7/app/ActionBarActivity;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)Landroid/support/v7/app/ActionBarActivity;

    move-result-object v4

    if-nez v4, :cond_13

    .line 199
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 212
    :goto_12
    return-object v1

    .line 203
    :cond_13
    if-eqz p2, :cond_25

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "NON_DROPDOWN"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 204
    :cond_25
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->mContext:Landroid/support/v7/app/ActionBarActivity;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)Landroid/support/v7/app/ActionBarActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/app/ActionBarActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_spinner_item_actionbar:I

    invoke-virtual {v4, v5, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 206
    const-string v4, "NON_DROPDOWN"

    invoke-virtual {p2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 208
    :cond_3a
    const v4, 0x1020014

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 209
    .local v2, "textView":Landroid/widget/TextView;
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->getTitle(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$id;->action_bar_dropdown_arrow:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 211
    .local v0, "arrowDown":Landroid/widget/RelativeLayout;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->shouldEnableDropDownSelection()Z
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;)Z

    move-result v4

    if-eqz v4, :cond_5f

    :goto_5a
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    move-object v1, p2

    .line 212
    goto :goto_12

    .line 211
    :cond_5f
    const/16 v3, 0x8

    goto :goto_5a
.end method
