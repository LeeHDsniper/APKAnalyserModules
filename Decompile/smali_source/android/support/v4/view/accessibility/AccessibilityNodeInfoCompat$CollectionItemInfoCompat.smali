.class public Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CollectionItemInfoCompat"
.end annotation


# instance fields
.field private final mInfo:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    iput-object p1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->mInfo:Ljava/lang/Object;

    .line 130
    return-void
.end method

.method static synthetic access$300(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    .prologue
    .line 113
    iget-object v0, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->mInfo:Ljava/lang/Object;

    return-object v0
.end method

.method public static obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;
    .registers 14
    .param p0, "rowIndex"    # I
    .param p1, "rowSpan"    # I
    .param p2, "columnIndex"    # I
    .param p3, "columnSpan"    # I
    .param p4, "heading"    # Z
    .param p5, "selected"    # Z

    .prologue
    .line 124
    new-instance v7, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    # getter for: Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->access$000()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    move-result-object v0

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-interface/range {v0 .. v6}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->obtainCollectionItemInfo(IIIIZZ)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v7, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;-><init>(Ljava/lang/Object;)V

    return-object v7
.end method
