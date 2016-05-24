.class public final enum Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
.super Ljava/lang/Enum;
.source "NativeToolFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TiltShiftMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

.field public static final enum Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

.field public static final enum None:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

.field public static final enum Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    const-string v1, "Radial"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    const-string v1, "Linear"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    const-string v1, "None"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->None:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->None:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    return-object v0
.end method
