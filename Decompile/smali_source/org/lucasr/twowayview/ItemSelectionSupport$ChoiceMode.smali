.class public final enum Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;
.super Ljava/lang/Enum;
.source "ItemSelectionSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/ItemSelectionSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ChoiceMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

.field public static final enum MULTIPLE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

.field public static final enum NONE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

.field public static final enum SINGLE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->NONE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    .line 24
    new-instance v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    const-string v1, "SINGLE"

    invoke-direct {v0, v1, v3}, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->SINGLE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    .line 25
    new-instance v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    const-string v1, "MULTIPLE"

    invoke-direct {v0, v1, v4}, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->MULTIPLE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    sget-object v1, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->NONE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    aput-object v1, v0, v2

    sget-object v1, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->SINGLE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    aput-object v1, v0, v3

    sget-object v1, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->MULTIPLE:Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    aput-object v1, v0, v4

    sput-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->$VALUES:[Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    return-object v0
.end method

.method public static values()[Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->$VALUES:[Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    invoke-virtual {v0}, [Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/lucasr/twowayview/ItemSelectionSupport$ChoiceMode;

    return-object v0
.end method
