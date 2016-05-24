.class public final enum Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;
.super Ljava/lang/Enum;
.source "LoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/log/LoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LoggerType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

.field public static final enum ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    const-string v1, "ConsoleLoggerType"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    .line 24
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    aput-object v1, v0, v2

    sput-object v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->$VALUES:[Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->$VALUES:[Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    return-object v0
.end method
