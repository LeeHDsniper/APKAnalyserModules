.class public Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
.super Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;
.source "BaseLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/BaseLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "LanedSavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

.field private laneSize:I

.field private lanes:[Landroid/graphics/Rect;

.field private orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 631
    new-instance v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState$1;

    invoke-direct {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState$1;-><init>()V

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 9
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 584
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;-><init>(Landroid/os/Parcel;)V

    .line 586
    invoke-static {}, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->values()[Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v5

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    aget-object v5, v5, v6

    iput-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .line 587
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I

    .line 589
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 590
    .local v4, "laneCount":I
    if-lez v4, :cond_31

    .line 591
    new-array v5, v4, [Landroid/graphics/Rect;

    iput-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    .line 592
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    if-ge v1, v4, :cond_31

    .line 593
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 594
    .local v3, "lane":Landroid/graphics/Rect;
    invoke-virtual {v3, p1}, Landroid/graphics/Rect;->readFromParcel(Landroid/os/Parcel;)V

    .line 595
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    aput-object v3, v5, v1

    .line 592
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 599
    .end local v1    # "i":I
    .end local v3    # "lane":Landroid/graphics/Rect;
    :cond_31
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 600
    .local v2, "itemEntriesCount":I
    if-lez v2, :cond_57

    .line 601
    new-instance v5, Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-direct {v5}, Lorg/lucasr/twowayview/widget/ItemEntries;-><init>()V

    iput-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    .line 602
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3f
    if-ge v1, v2, :cond_57

    .line 603
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .line 604
    .local v0, "entry":Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v5, v1, v0}, Lorg/lucasr/twowayview/widget/ItemEntries;->restoreItemEntry(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V

    .line 602
    add-int/lit8 v1, v1, 0x1

    goto :goto_3f

    .line 607
    .end local v0    # "entry":Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .end local v1    # "i":I
    :cond_57
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lorg/lucasr/twowayview/widget/BaseLayoutManager$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$1;

    .prologue
    .line 573
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 580
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 581
    return-void
.end method

.method static synthetic access$300(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)[Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;

    .prologue
    .line 573
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$302(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;[Landroid/graphics/Rect;)[Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
    .param p1, "x1"    # [Landroid/graphics/Rect;

    .prologue
    .line 573
    iput-object p1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    return-object p1
.end method

.method static synthetic access$400(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;

    .prologue
    .line 573
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    return-object v0
.end method

.method static synthetic access$402(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
    .param p1, "x1"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .prologue
    .line 573
    iput-object p1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    return-object p1
.end method

.method static synthetic access$500(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;

    .prologue
    .line 573
    iget v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I

    return v0
.end method

.method static synthetic access$502(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;I)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
    .param p1, "x1"    # I

    .prologue
    .line 573
    iput p1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I

    return p1
.end method

.method static synthetic access$600(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)Lorg/lucasr/twowayview/widget/ItemEntries;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;

    .prologue
    .line 573
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    return-object v0
.end method

.method static synthetic access$602(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;Lorg/lucasr/twowayview/widget/ItemEntries;)Lorg/lucasr/twowayview/widget/ItemEntries;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
    .param p1, "x1"    # Lorg/lucasr/twowayview/widget/ItemEntries;

    .prologue
    .line 573
    iput-object p1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    return-object p1
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 9
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v3, 0x0

    .line 611
    invoke-super {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 613
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    invoke-virtual {v4}, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->ordinal()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 614
    iget v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 616
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    if-eqz v4, :cond_2a

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    array-length v2, v4

    .line 617
    .local v2, "laneCount":I
    :goto_19
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 619
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    if-ge v0, v2, :cond_2c

    .line 620
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;

    aget-object v4, v4, v0

    const/4 v5, 0x1

    invoke-virtual {v4, p1, v5}, Landroid/graphics/Rect;->writeToParcel(Landroid/os/Parcel;I)V

    .line 619
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .end local v0    # "i":I
    .end local v2    # "laneCount":I
    :cond_2a
    move v2, v3

    .line 616
    goto :goto_19

    .line 623
    .restart local v0    # "i":I
    .restart local v2    # "laneCount":I
    :cond_2c
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v4, :cond_48

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v3}, Lorg/lucasr/twowayview/widget/ItemEntries;->size()I

    move-result v1

    .line 624
    .local v1, "itemEntriesCount":I
    :goto_36
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 626
    const/4 v0, 0x0

    :goto_3a
    if-ge v0, v1, :cond_4a

    .line 627
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v3, v0}, Lorg/lucasr/twowayview/widget/ItemEntries;->getItemEntry(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v3

    invoke-virtual {p1, v3, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 626
    add-int/lit8 v0, v0, 0x1

    goto :goto_3a

    .end local v1    # "itemEntriesCount":I
    :cond_48
    move v1, v3

    .line 623
    goto :goto_36

    .line 629
    .restart local v1    # "itemEntriesCount":I
    :cond_4a
    return-void
.end method
