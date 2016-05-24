.class final enum Lorg/apache/http/impl/auth/GGSSchemeBase$State;
.super Ljava/lang/Enum;
.source "GGSSchemeBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/GGSSchemeBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/apache/http/impl/auth/GGSSchemeBase$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/http/impl/auth/GGSSchemeBase$State;

.field public static final enum CHALLENGE_RECEIVED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

.field public static final enum FAILED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

.field public static final enum TOKEN_GENERATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

.field public static final enum UNINITIATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 60
    new-instance v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    const-string v1, "UNINITIATED"

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/auth/GGSSchemeBase$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->UNINITIATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 61
    new-instance v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    const-string v1, "CHALLENGE_RECEIVED"

    invoke-direct {v0, v1, v3}, Lorg/apache/http/impl/auth/GGSSchemeBase$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->CHALLENGE_RECEIVED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 62
    new-instance v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    const-string v1, "TOKEN_GENERATED"

    invoke-direct {v0, v1, v4}, Lorg/apache/http/impl/auth/GGSSchemeBase$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->TOKEN_GENERATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 63
    new-instance v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    const-string v1, "FAILED"

    invoke-direct {v0, v1, v5}, Lorg/apache/http/impl/auth/GGSSchemeBase$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->FAILED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 59
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->UNINITIATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    aput-object v1, v0, v2

    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->CHALLENGE_RECEIVED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    aput-object v1, v0, v3

    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->TOKEN_GENERATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    aput-object v1, v0, v4

    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->FAILED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    aput-object v1, v0, v5

    sput-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->$VALUES:[Lorg/apache/http/impl/auth/GGSSchemeBase$State;

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
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/http/impl/auth/GGSSchemeBase$State;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    const-class v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    return-object v0
.end method

.method public static values()[Lorg/apache/http/impl/auth/GGSSchemeBase$State;
    .registers 1

    .prologue
    .line 59
    sget-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->$VALUES:[Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    invoke-virtual {v0}, [Lorg/apache/http/impl/auth/GGSSchemeBase$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    return-object v0
.end method
