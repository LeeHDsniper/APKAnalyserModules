.class public final Lcom/getbase/floatingactionbutton/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getbase/floatingactionbutton/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final AddFloatingActionButton:[I

.field public static final AddFloatingActionButton_fab_plusIconColor:I = 0x0

.field public static final FloatingActionButton:[I

.field public static final FloatingActionButton_fab_colorDisabled:I = 0x7

.field public static final FloatingActionButton_fab_colorNormal:I = 0x8

.field public static final FloatingActionButton_fab_colorPressed:I = 0x6

.field public static final FloatingActionButton_fab_icon:I = 0x9

.field public static final FloatingActionButton_fab_size:I = 0xa

.field public static final FloatingActionButton_fab_stroke_visible:I = 0xc

.field public static final FloatingActionButton_fab_title:I = 0xb

.field public static final FloatingActionsMenu:[I

.field public static final FloatingActionsMenu_fab_addButtonColorNormal:I = 0x1

.field public static final FloatingActionsMenu_fab_addButtonColorPressed:I = 0x0

.field public static final FloatingActionsMenu_fab_addButtonPlusIconColor:I = 0x3

.field public static final FloatingActionsMenu_fab_addButtonSize:I = 0x2

.field public static final FloatingActionsMenu_fab_addButtonStrokeVisible:I = 0x4

.field public static final FloatingActionsMenu_fab_expandDirection:I = 0x7

.field public static final FloatingActionsMenu_fab_labelStyle:I = 0x5

.field public static final FloatingActionsMenu_fab_labelsPosition:I = 0x6


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 55
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x7f01004d

    aput v2, v0, v1

    sput-object v0, Lcom/getbase/floatingactionbutton/R$styleable;->AddFloatingActionButton:[I

    .line 57
    const/16 v0, 0xf

    new-array v0, v0, [I

    fill-array-data v0, :array_1e

    sput-object v0, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton:[I

    .line 65
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_40

    sput-object v0, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionsMenu:[I

    return-void

    .line 57
    :array_1e
    .array-data 4
        0x10100d4
        0x7f010048
        0x7f0100db
        0x7f0100dc
        0x7f0100dd
        0x7f0100de
        0x7f0100df
        0x7f0100e0
        0x7f0100e1
        0x7f0100e2
        0x7f0100e3
        0x7f0100e4
        0x7f0100e5
        0x7f0101c3
        0x7f0101c4
    .end array-data

    .line 65
    :array_40
    .array-data 4
        0x7f0100e6
        0x7f0100e7
        0x7f0100e8
        0x7f0100e9
        0x7f0100ea
        0x7f0100eb
        0x7f0100ec
        0x7f0100ed
    .end array-data
.end method
