.class Lcom/localytics/android/TestModeListView$MenuItemAdapter;
.super Landroid/widget/BaseAdapter;
.source "TestModeListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/TestModeListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MenuItemAdapter"
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
    .line 662
    iput-object p1, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 657
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Disable Test Mode"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Refresh"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Copy Push Token"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Copy Install ID"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    .line 663
    iput-object p2, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->mContext:Landroid/content/Context;

    .line 664
    return-void
.end method

.method private getShape(I)Landroid/graphics/drawable/Drawable;
    .registers 11
    .param p1, "position"    # I

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 686
    iget-object v2, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v2}, Lcom/localytics/android/TestModeListView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x41000000

    mul-float v1, v2, v3

    .line 688
    .local v1, "radius":F
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v3, v6, [I

    fill-array-data v3, :array_60

    invoke-direct {v0, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 689
    .local v0, "gradientDrawable":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 690
    packed-switch p1, :pswitch_data_6a

    .line 703
    :goto_27
    :pswitch_27
    return-object v0

    .line 693
    :pswitch_28
    const/16 v2, 0x8

    new-array v2, v2, [F

    aput v1, v2, v5

    aput v1, v2, v7

    aput v1, v2, v8

    aput v1, v2, v6

    const/4 v3, 0x4

    aput v4, v2, v3

    const/4 v3, 0x5

    aput v4, v2, v3

    const/4 v3, 0x6

    aput v4, v2, v3

    const/4 v3, 0x7

    aput v4, v2, v3

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    goto :goto_27

    .line 699
    :pswitch_44
    const/16 v2, 0x8

    new-array v2, v2, [F

    aput v4, v2, v5

    aput v4, v2, v7

    aput v4, v2, v8

    aput v4, v2, v6

    const/4 v3, 0x4

    aput v1, v2, v3

    const/4 v3, 0x5

    aput v1, v2, v3

    const/4 v3, 0x6

    aput v1, v2, v3

    const/4 v3, 0x7

    aput v1, v2, v3

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    goto :goto_27

    .line 688
    :array_60
    .array-data 4
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 690
    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_28
        :pswitch_27
        :pswitch_27
        :pswitch_44
    .end packed-switch
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 669
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 655
    invoke-virtual {p0, p1}, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/String;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 675
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 681
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/16 v9, 0xff

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 709
    move-object v3, p2

    .line 711
    .local v3, "view":Landroid/view/View;
    if-nez v3, :cond_59

    .line 713
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 714
    .local v1, "layout":Landroid/widget/LinearLayout;
    new-instance v4, Landroid/widget/AbsListView$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 715
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 716
    iget-object v4, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x40c00000

    mul-float/2addr v4, v5

    const/high16 v5, 0x3f000000

    add-float/2addr v4, v5

    float-to-int v2, v4

    .line 717
    .local v2, "padding":I
    invoke-virtual {v1, v7, v2, v7, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 720
    new-instance v0, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 721
    .local v0, "item":Landroid/widget/TextView;
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setId(I)V

    .line 722
    const/high16 v4, 0x41d00000

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 723
    const/16 v4, 0x5b

    invoke-static {v9, v7, v4, v9}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 724
    const/16 v4, 0x11

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 725
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 728
    move-object v3, v1

    .line 730
    invoke-direct {p0, p1}, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->getShape(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 734
    .end local v0    # "item":Landroid/widget/TextView;
    .end local v1    # "layout":Landroid/widget/LinearLayout;
    .end local v2    # "padding":I
    :cond_59
    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 735
    .restart local v0    # "item":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/localytics/android/TestModeListView$MenuItemAdapter;->MENU_ITEMS:[Ljava/lang/String;

    aget-object v4, v4, p1

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 737
    packed-switch p1, :pswitch_data_70

    .line 748
    :goto_69
    return-object v3

    .line 740
    :pswitch_6a
    const/high16 v4, -0x10000

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_69

    .line 737
    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_6a
    .end packed-switch
.end method
