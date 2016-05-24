.class public final Lorg/apache/commons/io/IOCase;
.super Ljava/lang/Object;
.source "IOCase.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final INSENSITIVE:Lorg/apache/commons/io/IOCase;

.field public static final SENSITIVE:Lorg/apache/commons/io/IOCase;

.field public static final SYSTEM:Lorg/apache/commons/io/IOCase;

.field private static final serialVersionUID:J = -0x580776bc651386cfL


# instance fields
.field private final name:Ljava/lang/String;

.field private final transient sensitive:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 42
    new-instance v2, Lorg/apache/commons/io/IOCase;

    const-string v3, "Sensitive"

    invoke-direct {v2, v3, v0}, Lorg/apache/commons/io/IOCase;-><init>(Ljava/lang/String;Z)V

    sput-object v2, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .line 47
    new-instance v2, Lorg/apache/commons/io/IOCase;

    const-string v3, "Insensitive"

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/io/IOCase;-><init>(Ljava/lang/String;Z)V

    sput-object v2, Lorg/apache/commons/io/IOCase;->INSENSITIVE:Lorg/apache/commons/io/IOCase;

    .line 61
    new-instance v2, Lorg/apache/commons/io/IOCase;

    const-string v3, "System"

    invoke-static {}, Lorg/apache/commons/io/FilenameUtils;->isSystemWindows()Z

    move-result v4

    if-nez v4, :cond_24

    :goto_1e
    invoke-direct {v2, v3, v0}, Lorg/apache/commons/io/IOCase;-><init>(Ljava/lang/String;Z)V

    sput-object v2, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    return-void

    :cond_24
    move v0, v1

    goto :goto_1e
.end method

.method private constructor <init>(Ljava/lang/String;Z)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sensitive"    # Z

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lorg/apache/commons/io/IOCase;->name:Ljava/lang/String;

    .line 102
    iput-boolean p2, p0, Lorg/apache/commons/io/IOCase;->sensitive:Z

    .line 103
    return-void
.end method

.method public static forName(Ljava/lang/String;)Lorg/apache/commons/io/IOCase;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 81
    sget-object v0, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    iget-object v0, v0, Lorg/apache/commons/io/IOCase;->name:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 82
    sget-object v0, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .line 88
    :goto_c
    return-object v0

    .line 84
    :cond_d
    sget-object v0, Lorg/apache/commons/io/IOCase;->INSENSITIVE:Lorg/apache/commons/io/IOCase;

    iget-object v0, v0, Lorg/apache/commons/io/IOCase;->name:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 85
    sget-object v0, Lorg/apache/commons/io/IOCase;->INSENSITIVE:Lorg/apache/commons/io/IOCase;

    goto :goto_c

    .line 87
    :cond_1a
    sget-object v0, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    iget-object v0, v0, Lorg/apache/commons/io/IOCase;->name:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 88
    sget-object v0, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    goto :goto_c

    .line 90
    :cond_27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid IOCase name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lorg/apache/commons/io/IOCase;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/io/IOCase;->forName(Ljava/lang/String;)Lorg/apache/commons/io/IOCase;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public checkEquals(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "str1"    # Ljava/lang/String;
    .param p2, "str2"    # Ljava/lang/String;

    .prologue
    .line 165
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 166
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "The strings must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_c
    iget-boolean v0, p0, Lorg/apache/commons/io/IOCase;->sensitive:Z

    if-eqz v0, :cond_15

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_14
    return v0

    :cond_15
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_14
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lorg/apache/commons/io/IOCase;->name:Ljava/lang/String;

    return-object v0
.end method
