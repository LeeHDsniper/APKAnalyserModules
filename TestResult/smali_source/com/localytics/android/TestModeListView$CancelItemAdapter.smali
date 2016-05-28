.class Lcom/localytics/android/TestModeListView$CancelItemAdapter;
.super Landroid/widget/BaseAdapter;
.source "TestModeListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/TestModeListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CancelItemAdapter"
.end annotation


# instance fields
.field private final MENU_ITEMS:[Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/localytics/android/TestModeListView;


# direct methods
.method public constructor <init>(Lcom/localytics/android/TestModeListView;Landroid/content/Context;)V
    .registers 6
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 759
    iput-object p1, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 754
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Cancel"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    .line 760
    iput-object p2, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->mContext:Landroid/content/Context;

    .line 761
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 766
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 752
    invoke-virtual {p0, p1}, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/String;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 772
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 778
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 784
    move-object v5, p2

    .line 786
    .local v5, "view":Landroid/view/View;
    if-nez v5, :cond_9a

    .line 788
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v2, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 789
    .local v2, "layout":Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/AbsListView$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 790
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 791
    iget-object v6, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x40c00000

    mul-float/2addr v6, v7

    const/high16 v7, 0x3f000000

    add-float/2addr v6, v7

    float-to-int v3, v6

    .line 792
    .local v3, "padding":I
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v2, v6, v3, v7, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 795
    new-instance v1, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v1, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 796
    .local v1, "item":Landroid/widget/TextView;
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setId(I)V

    .line 797
    const/high16 v6, 0x41d00000

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 798
    const/16 v6, 0xff

    const/4 v7, 0x0

    const/16 v8, 0x5b

    const/16 v9, 0xff

    invoke-static {v6, v7, v8, v9}, Landroid/graphics/Color;->argb(IIII)I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 799
    const/16 v6, 0x11

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 800
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 803
    move-object v5, v2

    .line 805
    iget-object v6, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v6}, Lcom/localytics/android/TestModeListView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41000000

    mul-float v4, v6, v7

    .line 806
    .local v4, "radius":F
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v6, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v7, 0x3

    new-array v7, v7, [I

    fill-array-data v7, :array_ae

    invoke-direct {v0, v6, v7}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 807
    .local v0, "gradientDrawable":Landroid/graphics/drawable/GradientDrawable;
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 808
    const/16 v6, 0x8

    new-array v6, v6, [F

    const/4 v7, 0x0

    aput v4, v6, v7

    const/4 v7, 0x1

    aput v4, v6, v7

    const/4 v7, 0x2

    aput v4, v6, v7

    const/4 v7, 0x3

    aput v4, v6, v7

    const/4 v7, 0x4

    aput v4, v6, v7

    const/4 v7, 0x5

    aput v4, v6, v7

    const/4 v7, 0x6

    aput v4, v6, v7

    const/4 v7, 0x7

    aput v4, v6, v7

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 809
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 813
    .end local v0    # "gradientDrawable":Landroid/graphics/drawable/GradientDrawable;
    .end local v1    # "item":Landroid/widget/TextView;
    .end local v2    # "layout":Landroid/widget/LinearLayout;
    .end local v3    # "padding":I
    .end local v4    # "radius":F
    :cond_9a
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 814
    .restart local v1    # "item":Landroid/widget/TextView;
    iget-object v6, p0, Lcom/localytics/android/TestModeListView$CancelItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    aget-object v6, v6, p1

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 815
    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v1, v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 817
    return-object v5

    .line 806
    :array_ae
    .array-data 4
        -0x1
        -0x1
        -0x1
    .end array-data
.end method
