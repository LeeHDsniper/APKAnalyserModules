.class public Landroid/support/v7/internal/app/AppCompatViewInflater;
.super Ljava/lang/Object;
.source "AppCompatViewInflater.java"


# static fields
.field private static final sConstructorMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor",
            "<+",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field static final sConstructorSignature:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field private final mConstructorArgs:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 57
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorSignature:[Ljava/lang/Class;

    .line 62
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    sput-object v0, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    return-void
.end method

.method private createView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Landroid/view/InflateException;
        }
    .end annotation

    .prologue
    .line 143
    sget-object v3, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    .line 146
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Landroid/view/View;>;"
    if-nez v1, :cond_36

    .line 148
    :try_start_a
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    if-eqz p3, :cond_43

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_21
    invoke-virtual {v4, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-class v4, Landroid/view/View;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 151
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    sget-object v3, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorSignature:[Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 152
    sget-object v3, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    invoke-interface {v3, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    :cond_36
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 155
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_42} :catch_45

    .line 159
    :goto_42
    return-object v3

    :cond_43
    move-object v3, p2

    .line 148
    goto :goto_21

    .line 156
    :catch_45
    move-exception v2

    .line 159
    .local v2, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_42
.end method

.method private createViewFromTag(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 116
    const-string v1, "view"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 117
    const-string v1, "class"

    invoke-interface {p3, v2, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 121
    :cond_11
    :try_start_11
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    .line 122
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v3, 0x1

    aput-object p3, v1, v3

    .line 124
    const/4 v1, -0x1

    const/16 v3, 0x2e

    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ne v1, v3, :cond_33

    .line 126
    const-string v1, "android.widget."

    invoke-direct {p0, p1, p2, v1}, Landroid/support/v7/internal/app/AppCompatViewInflater;->createView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_29} :catch_41
    .catchall {:try_start_11 .. :try_end_29} :catchall_4c

    move-result-object v1

    .line 136
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 137
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v5

    :goto_32
    return-object v1

    .line 128
    :cond_33
    const/4 v1, 0x0

    :try_start_34
    invoke-direct {p0, p1, p2, v1}, Landroid/support/v7/internal/app/AppCompatViewInflater;->createView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_37} :catch_41
    .catchall {:try_start_34 .. :try_end_37} :catchall_4c

    move-result-object v1

    .line 136
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 137
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v5

    goto :goto_32

    .line 130
    :catch_41
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v1, v4

    .line 137
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v1, v5

    move-object v1, v2

    goto :goto_32

    .line 136
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_4c
    move-exception v1

    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 137
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v5

    throw v1
.end method

.method private static themifyContext(Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Landroid/content/Context;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "useAndroidTheme"    # Z
    .param p3, "useAppTheme"    # Z

    .prologue
    const/4 v4, 0x0

    .line 168
    sget-object v3, Landroid/support/v7/appcompat/R$styleable;->View:[I

    invoke-virtual {p0, p1, v3, v4, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 169
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    .line 170
    .local v2, "themeId":I
    if-eqz p2, :cond_10

    .line 172
    sget v3, Landroid/support/v7/appcompat/R$styleable;->View_android_theme:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 174
    :cond_10
    if-eqz p3, :cond_23

    if-nez v2, :cond_23

    .line 176
    sget v3, Landroid/support/v7/appcompat/R$styleable;->View_theme:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 178
    if-eqz v2, :cond_23

    .line 179
    const-string v3, "AppCompatViewInflater"

    const-string v4, "app:theme is now deprecated. Please move to using android:theme instead."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    :cond_23
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 185
    if-eqz v2, :cond_3b

    instance-of v3, p0, Landroid/support/v7/internal/view/ContextThemeWrapper;

    if-eqz v3, :cond_35

    move-object v3, p0

    check-cast v3, Landroid/support/v7/internal/view/ContextThemeWrapper;

    invoke-virtual {v3}, Landroid/support/v7/internal/view/ContextThemeWrapper;->getThemeResId()I

    move-result v3

    if-eq v3, v2, :cond_3b

    .line 189
    :cond_35
    new-instance v1, Landroid/support/v7/internal/view/ContextThemeWrapper;

    invoke-direct {v1, p0, v2}, Landroid/support/v7/internal/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .end local p0    # "context":Landroid/content/Context;
    .local v1, "context":Landroid/content/Context;
    move-object p0, v1

    .line 191
    .end local v1    # "context":Landroid/content/Context;
    .restart local p0    # "context":Landroid/content/Context;
    :cond_3b
    return-object p0
.end method


# virtual methods
.method public final createView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZZ)Landroid/view/View;
    .registers 11
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "attrs"    # Landroid/util/AttributeSet;
    .param p5, "inheritContext"    # Z
    .param p6, "readAndroidTheme"    # Z
    .param p7, "readAppTheme"    # Z

    .prologue
    .line 70
    move-object v0, p3

    .line 74
    .local v0, "originalContext":Landroid/content/Context;
    if-eqz p5, :cond_9

    if-eqz p1, :cond_9

    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    .line 77
    :cond_9
    if-nez p6, :cond_d

    if-eqz p7, :cond_11

    .line 79
    :cond_d
    invoke-static {p3, p4, p6, p7}, Landroid/support/v7/internal/app/AppCompatViewInflater;->themifyContext(Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Landroid/content/Context;

    move-result-object p3

    .line 83
    :cond_11
    const/4 v1, -0x1

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_ce

    :cond_19
    :goto_19
    packed-switch v1, :pswitch_data_f8

    .line 106
    if-eq v0, p3, :cond_cb

    .line 109
    invoke-direct {p0, p3, p2, p4}, Landroid/support/v7/internal/app/AppCompatViewInflater;->createViewFromTag(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 112
    :goto_22
    return-object v1

    .line 83
    :sswitch_23
    const-string v2, "EditText"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x0

    goto :goto_19

    :sswitch_2d
    const-string v2, "Spinner"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x1

    goto :goto_19

    :sswitch_37
    const-string v2, "CheckBox"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x2

    goto :goto_19

    :sswitch_41
    const-string v2, "RadioButton"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x3

    goto :goto_19

    :sswitch_4b
    const-string v2, "CheckedTextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x4

    goto :goto_19

    :sswitch_55
    const-string v2, "AutoCompleteTextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x5

    goto :goto_19

    :sswitch_5f
    const-string v2, "MultiAutoCompleteTextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x6

    goto :goto_19

    :sswitch_69
    const-string v2, "RatingBar"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x7

    goto :goto_19

    :sswitch_73
    const-string v2, "Button"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/16 v1, 0x8

    goto :goto_19

    :sswitch_7e
    const-string v2, "TextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/16 v1, 0x9

    goto :goto_19

    .line 85
    :pswitch_89
    new-instance v1, Landroid/support/v7/widget/AppCompatEditText;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_22

    .line 87
    :pswitch_8f
    new-instance v1, Landroid/support/v7/widget/AppCompatSpinner;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_22

    .line 89
    :pswitch_95
    new-instance v1, Landroid/support/v7/widget/AppCompatCheckBox;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_22

    .line 91
    :pswitch_9b
    new-instance v1, Landroid/support/v7/widget/AppCompatRadioButton;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_22

    .line 93
    :pswitch_a1
    new-instance v1, Landroid/support/v7/widget/AppCompatCheckedTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatCheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_22

    .line 95
    :pswitch_a8
    new-instance v1, Landroid/support/v7/widget/AppCompatAutoCompleteTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_22

    .line 97
    :pswitch_af
    new-instance v1, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_22

    .line 99
    :pswitch_b6
    new-instance v1, Landroid/support/v7/widget/AppCompatRatingBar;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatRatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_22

    .line 101
    :pswitch_bd
    new-instance v1, Landroid/support/v7/widget/AppCompatButton;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_22

    .line 103
    :pswitch_c4
    new-instance v1, Landroid/support/v7/widget/AppCompatTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_22

    .line 112
    :cond_cb
    const/4 v1, 0x0

    goto/16 :goto_22

    .line 83
    :sswitch_data_ce
    .sparse-switch
        -0x7404ceea -> :sswitch_69
        -0x56c015e7 -> :sswitch_4b
        -0x503aa7ad -> :sswitch_5f
        -0x37f7066e -> :sswitch_7e
        -0x1440b607 -> :sswitch_2d
        0x2e46a6ed -> :sswitch_41
        0x5445f9ba -> :sswitch_55
        0x5f7507c3 -> :sswitch_37
        0x63577677 -> :sswitch_23
        0x77471352 -> :sswitch_73
    .end sparse-switch

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_89
        :pswitch_8f
        :pswitch_95
        :pswitch_9b
        :pswitch_a1
        :pswitch_a8
        :pswitch_af
        :pswitch_b6
        :pswitch_bd
        :pswitch_c4
    .end packed-switch
.end method
